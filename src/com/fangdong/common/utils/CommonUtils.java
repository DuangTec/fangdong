package com.fangdong.common.utils;

import java.util.HashSet;
import java.util.Random;

public class CommonUtils {
	public static int[] randomNums(int max,int num){
		if(max<=0){
			int[] a = {-1};
			return a;
		}
		if(max==num){
			int[] resultArray = new int[num];
			for(int i=0;i<num;i++){
				resultArray[i]=i+1;
			}
			return resultArray;
		}
		
		HashSet<Integer> set = new HashSet<Integer>();
		Integer[] nums=new Integer[num];
		Random random=new Random();
		while(true){
			set.add(random.nextInt(max)+1);
			if(set.size()>=num){
				set.toArray(nums);
				break;
			}
		}
		
		int[] ns=new int[num];
		for(int i=0;i<nums.length;i++){
			ns[i]=nums[i];
		}
		return ns;
	}
}
