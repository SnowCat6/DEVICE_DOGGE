package com.mediatek.dialer.search;

import android.text.TextUtils;
import android.util.Log;

import com.android.dialer.dialpad.SmartDialMap;
import com.google.common.collect.Lists;
import com.mediatek.dialer.dialersearch.SmartDialPadMap;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Smart Dial utility class to find prefixes of contacts. It contains both methods to find supported
 * prefix combinations for contact names, and also methods to find supported prefix combinations for
 * contacts' phone numbers. Each contact name is separated into several tokens, such as first name,
 * middle name, family name etc. Each phone number is also separated into country code, NANP area
 * code, and local number if such separation is possible.
 */
public class SmartDialPrefixEx {
    private static final String TAG = SmartDialPrefixEx.class.getSimpleName();
    private static final boolean DEBUG = false;

    /** Dialpad mapping. */
    private static final SmartDialMap mMap = new SmartDialPadMap();

    // The max length for generate name prefix.
    private static final int MAX_NAME_LENGTH = 4;

    public static final String PREFIX_NA = "NA";
    /**
     * Parses a contact's name into a list of separated tokens.
     *
     * @param contactName Contact's name stored in string.
     * @return A list of name tokens, for example separated first names, last name, etc.
     */
    public static ArrayList<String> parseToIndexTokens(String contactName) {
        if (DEBUG) {
            Log.i(TAG, "parseToIndexTokens, contactName=" + contactName);
        }
        final ArrayList<String> result = Lists.newArrayList();
        // Normally the contact name can not be empty.
        if (TextUtils.isEmpty(contactName)) {
            return result;
        }
        final int length = contactName.length();
        final StringBuilder currentIndexToken = new StringBuilder();
        String word;
        byte bc;
        char c;
        int len;
        for (int i = 0; i < length; i = i + len + 1) {
            len = (int) contactName.charAt(i);
            word = contactName.substring(i + 1, i + len + 1);
            for (int j = 0; j < word.length(); j++) {
                c = mMap.normalizeCharacter(word.charAt(j));
                bc = mMap.getDialpadIndex(c);
                if (bc == -1) {
                    currentIndexToken.append(c);
                } else {
                    currentIndexToken.append(bc);
                }
            }
            result.add(currentIndexToken.toString());
            currentIndexToken.delete(0, currentIndexToken.length());
        }
        return result;
    }

    public static SmartDialMap getMap() {
        return mMap;
    }

    public static ArrayList<String> generateNamePrefixes(String name) {
        long start = System.currentTimeMillis();
        final ArrayList<String> result = Lists.newArrayList();

        /** Parses the name into a list of tokens. */
        final ArrayList<String> indexTokens = parseToIndexTokens(name);
        if (DEBUG) {
            Log.i(TAG, "parse tokens," + indexTokens.toString());
        }
        if (null != indexTokens && indexTokens.size() > MAX_NAME_LENGTH) {
            if (DEBUG) {
                Log.w(TAG, "name is too long:" + name);
            }
            result.add(PREFIX_NA);
            return result;
        }

        if (indexTokens.size() > 0) {
            List<String> indexes = Lists.newArrayList();
            List<String> fResult = Lists.newArrayList();
            List<String> mixedResult = Lists.newArrayList();
            for (int i = 0; i < indexTokens.size(); i++) {
                indexes.add(String.valueOf(i));
            }
            /**
             * Generate all the order sequence of the name words by the word's position(0,1,2,..)
             * in name string. And then take out the initial and full-spell string of the word
             * separately, to compose the prefix.
             */
            List<String> indexesList = generateDisorderIndex(indexes);
            for (String comb : indexesList) {
                int length = comb.length();
                List<String> partialList = Lists.newArrayList();
                List<String> removeList = Lists.newArrayList();
                int currentPos;
                int tempSize;
                String fullspell = "";
                /** [F] */
                for (int i = length - 1; i >= 0; i--) {
                    currentPos = comb.charAt(i) - '0';
                    fullspell = indexTokens.get(currentPos) + fullspell;
                }
                int lastPos = comb.charAt(length - 1) - '0';
                partialList.add(indexTokens.get(lastPos));
                for (int i = length - 2; i >= 0; i--) {
                    currentPos = comb.charAt(i) - '0';
                    /** Mixed match prefix: [I+F], [F+I]. */
                    tempSize = partialList.size();
                    for (int j = 0; j < tempSize; j++) {
                        String partial = partialList.get(j);
			// FIX crash with zero name length by SnowCat
			if (indexTokens.get(currentPos).length() > 0){
                        	partialList.add(indexTokens.get(currentPos).substring(0, 1) + partial);// I
			}
			//  End FIX
                        partialList.add(indexTokens.get(currentPos) + partial);// F
                        removeList.add(partial);
                    }
                    partialList.removeAll(removeList);
                }
                if (!fResult.contains(fullspell)) {
                    fResult.add(fullspell);
                }
                partialList.remove(fullspell);
                mixedResult.addAll(partialList);
            }
            result.addAll(fResult);
            for (String mixed : mixedResult) {
                if (!result.contains(mixed)) {
                    result.add(mixed);
                }
            }
        }

        StringBuilder prefixes = new StringBuilder();
        for (String prefix : result) {
            prefixes.append(" ");
            prefixes.append(prefix);
        }
        result.clear();
        result.add(prefixes.toString());

        if (DEBUG) {
            Log.d(TAG, String.format("GenNamePrefix spend %dms to handle [%s]. result.size[%d]",
                    (System.currentTimeMillis() - start), name, result.size()));
        }
        return result;
    }

    /**
     * Generate the disorder Prefixes for tokens
     * @param indexes if the name is "li xiao long", the tokens is [li,xiao,long]
     * @return
     */
    private static List<String> generateDisorderIndex(List<String> indexes) {
        if (null == indexes || indexes.size() == 0) {
            return new ArrayList<String>();
        }
        List<String> result = new ArrayList<String>();
        return getFullPermutation(result, indexes, "");
    }

    private static List<String> getFullPermutation(List<String> result, List<String> indexes,
            String prefix) {
        if (indexes.isEmpty()) {
            result.add(prefix);
        }
        for (int i = 0; i < indexes.size(); i++) {
            List subcandidate = new LinkedList(indexes);
            getFullPermutation(result, subcandidate, prefix + subcandidate.remove(i));
        }

        return result;
    }
}
