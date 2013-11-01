package net.loyin.util;

import java.text.DecimalFormat;

public class MoneyUtil {

	  /**
	   * 转亿以下的
	   * @param str
	   * @return
	   */   
	  public static double b2s(String str){
	      str=str.replaceAll("零", "");
	      double sum=0;
	      int index=str.indexOf("亿");
	      if (index>0){
	              String temp=str.substring(0,index );
	              str=str.substring(index+1);
	              sum=sum+w(temp)*100000000;
	      }
	      index=str.indexOf("万");
	      if (index>0){
	          String temp=str.substring(0,index );
	          str=str.substring(index+1);
	          sum=sum+w(temp)*10000;
	      }
	      index=str.indexOf("元");
	      if (index>0){
	          String temp=str.substring(0,index );
	          str=str.substring(index+1);
	          sum=sum+w(temp);
	      }
	      index=str.indexOf("角");
	      if (index>0){
	          String temp=str.substring(0,index );
	          str=str.substring(index+1);
	          sum=sum+str2num(temp)*0.1;
	      }
	      index=str.indexOf("分");
	      if (index>0){
	          String temp=str.substring(0,index );
	          str=str.substring(index+1);
	          sum=sum+str2num(temp)*0.01;
	      }
	        
	      return sum;
	  }
	  /**
	   * 大写转小写
	   * @param str
	   * @return
	   */
	  public static int str2num(String str){
	      String[] daxie={"壹","贰","叁","肆","伍","陆","柒","捌","玖"};
	      int[] num={1,2,3,4,5,6,7,8,9};
	      for (int i = 0; i < daxie.length; i++) {
	            if ( str.equals( daxie[i] ) ) {
	                 return num[i];
	            }
	          }
	      return 0;
	  }
	  /**
	   * @see 转万以下的
	   * @param str
	   * @return
	   */
	  public static double w(String str){
	      double sum=0;
	      int index=str.indexOf("仟");
	      if (index>0){
	          String temp=str.substring(0,index );
	          str=str.substring(index+1);
	          sum=sum+str2num(temp)*1000;
	      }
	      index=str.indexOf("佰");
	      if (index>0){
	          String temp=str.substring(0,index );
	          str=str.substring(index+1);
	          sum=sum+str2num(temp)*100;
	            
	      }
	      index=str.indexOf("拾");
	      if (index>0){
	          String temp=str.substring(0,index );
	          sum=sum+str2num(temp)*10;
	      }
	      if (str.length()>0) {
	          sum=sum+str2num(str) ;
	      }
	      return sum;
	  }
	  public static void main(String[] args) {
	      DecimalFormat df=new DecimalFormat();
	      //df.setMinimumFractionDigits(2);
	      //df.setMaximumFractionDigits(2);
	     System.out.println(df.format(b2s("拾壹亿元整") ));
	  }
}
