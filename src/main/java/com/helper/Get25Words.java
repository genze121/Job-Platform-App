package com.helper;

public class Get25Words {

	public static String get25Words(String description) {

		String[] str = description.split(" ");

		String result = "";

		if (str.length > 25) {
			for (int i = 0; i < 25; i++) {
				result = result + str[i] + " ";
			}

			return (result + ".....");
		} else {
			return (description + ".....");
		}

	}

}
