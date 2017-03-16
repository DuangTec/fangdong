package fangdong;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class Solution {
	public static void main(String[] args) {
		// HashMap<String, Object> h = new HashMap<>();
		// String a = "";
		// String b=String.valueOf(a.toCharArray());
		// String c = new String("");
		// h.put(a, "11");
		// System.out.println(h.containsKey(b));
		// System.out.println(a+b+c);
		// String[] d = { "", "" };
		// System.out.println(groupAnagrams(d));
		// System.out.println(romanToInt("MMMCMXCIX"));
		// int[] nums = { 2,3,4,5,6,33,233,2234};
		// int[] r = twoSum(nums, 7);
		// for (int i : r) {
		// System.out.print(i + " ");
		// }
		// System.out.println(guessNumber(2126753390));

//		ListNode l1 = new ListNode(3);
//		ListNode l2 = new ListNode(3);
//		l1.next = new ListNode(3);
//		l2.next= new ListNode(1);
////		l1.next.next=new ListNode(7);
//		ListNode ln = addTwoNumbers(l1, l2);
//		for(;ln!=null;ln=ln.next){
//			System.out.print(ln.val+" ");
//		}
		
		System.out.println(recoding("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
	}

	public static List<List<String>> groupAnagrams(String[] strs) {
		List<List<String>> resultList = new ArrayList<>();
		if (strs == null)
			return resultList;

		HashMap<String, Integer> map = new HashMap<String, Integer>();

		for (String str : strs) {
			char[] strChars = str.toCharArray();
			Arrays.sort(strChars);
			String sortedStr = String.valueOf(strChars);
			Integer index = map.get(sortedStr);
			if (index != null) {
				resultList.get(index).add(str);
			} else {
				map.put(sortedStr, resultList.size());
				List<String> innerList = new ArrayList<String>();
				innerList.add(str);
				resultList.add(innerList);
			}
		}
		return resultList;
	}

	public static boolean dd(String s, String t) {
		char[] charS = s.toCharArray();
		char[] charT = t.toCharArray();

		Arrays.sort(charS);
		Arrays.sort(charT);

		String sortedS = String.valueOf(charS);
		String sortedT = String.valueOf(charT);

		return sortedS.equals(sortedT);
	}

	public static int romanToInt(String s) {
		char[] sChar = s.toCharArray();
		int result = 0;
		int temp = 0, last = Integer.MAX_VALUE;
		for (char c : sChar) {
			switch (c) {
			case 'M':
				temp = 1000;
				break;
			case 'D':
				temp = 500;
				break;
			case 'C':
				temp = 100;
				break;
			case 'L':
				temp = 50;
				break;
			case 'X':
				temp = 10;
				break;
			case 'V':
				temp = 5;
				break;
			case 'I':
				temp = 1;
				break;
			}
			result += temp;
			if (temp > last) {
				result -= last;
				result -= last;
			}
			last = temp;
		}
		return result;
	}

	public static int[] twoSum(int[] numbers, int target) {
		int fp = 0, bp = numbers.length - 1;
		ArrayList<Integer> rList = new ArrayList<>();
		while (bp > fp) {
			if (target - numbers[fp] < numbers[bp]) {
				bp--;
			} else if (target - numbers[fp] > numbers[bp]) {
				fp++;
			} else if (target - numbers[fp] == numbers[bp]) {
				rList.add(fp + 1);
				rList.add(bp + 1);
				bp--;
				fp++;
			}
		}
		int[] rNums = new int[rList.size()];
		for (int i = 0; i < rNums.length; i++) {
			rNums[i] = rList.get(i);
		}
		Arrays.sort(rNums);
		return rNums;
	}

	public static int guessNumber(int n) {
		int low = 1, high = n;
		int mid = (high + low) / 2;
		for (; high > low; mid = low + (high - low) / 2) {
			switch (guess(mid)) {
			case 1:
				low = mid + 1;
				continue;
			case -1:
				high = mid - 1;
				continue;
			}
			return mid;
		}
		return mid;
	}

	public static int guess(int n) {
		int an = 1702766719;
		if (n > an)
			return -1;
		if (n == an)
			return 0;
		if (n < an)
			return 1;
		return -1;
	}

	public static ListNode addTwoNumbers(ListNode l1, ListNode l2) {
		boolean carry = false;
		ListNode resultNode = new ListNode(-1);
		ListNode head1, head2, headResult = resultNode;
		for (head1 = l1, head2 = l2; (head1 != null) && (head2 != null); head1 = head1.next, head2 = head2.next) {
			int val = head1.val + head2.val;
			if (carry) {
				val++;
				carry = false;
			}
			if (val >= 10) {
				val -= 10;
				carry = true;
			}
			ListNode node = new ListNode(val);
			headResult.next = node;
			headResult = headResult.next;
		}
		
		ListNode headLeft;
		if(head1!=null){
			headLeft=head1;
		} else if(head2!=null){
			headLeft=head2;
		} else{
			headLeft=null;
		}
		ListNode headLeftFirst=headLeft;
		
		//如果有进位
		while(carry){
			//如果有多余的链表
			//这一位加到当前节点
			if(headLeft!=null){
				headLeft.val+=1;
				if(headLeft.val>=10){
					headLeft.val-=10;
					if(headLeft.next!=null)
						headLeft=headLeft.next;
					else{
						headLeft.next = new ListNode(1);
						headLeft = headLeft.next;
						carry=false;
					}
				} else{
					carry=false;
				}
			} else{
				headResult.next=new ListNode(1);
				headResult=headResult.next;
				carry=false;
			}
		}
		headResult.next=headLeftFirst;

		return resultNode.next;
	}
	
	public static String recoding(String str){
        String resultStr="";
	char[] chars = str.toCharArray();
	int charNum=1;

	for(int i=1;i<chars.length;i++){
		if(chars[i]==chars[i-1])
			charNum++;
		else{
			resultStr+=charNum+""+chars[i-1];
			charNum=1;
		}
	}
	resultStr+=charNum+""+chars[chars.length-1];
        
        return resultStr;
}
}

class ListNode {
	int val;
	ListNode next;

	ListNode(int x) {
		val = x;
	}
}
