package sql;

import java.sql.*;
import java.util.HashSet;
import java.util.Scanner;  
class query{  
	public static void queryMethod(String[] deps,String[] taken) {
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/classes?serverTimezone=UTC","root","password");  
			String keep="jdbc:mysql://localhost:3306/classes";
			String select=" SELECT * FROM (";
			String query="(SELECT A.name AS firstClass, B.name AS secondClass, C.name as third,"+
					" D.name as fourth "+
					"FROM "+deps[0]+" A, "+ deps[1]+" B, "+deps[2]+" C, "+deps[3]+" D "+
					"WHERE (A.day<>B.day OR A.endTime<=B.starttime OR A.startTime>=B.endTime) AND "+
					"(C.day<>B.day OR C.endTime<=B.starttime OR C.startTime>=B.endTime)AND "+
					"(D.day<>B.day OR D.endTime<=B.starttime OR D.startTime>=B.endTime) AND "+ 
					"(A.day<>C.day OR A.endTime<=C.starttime OR A.startTime>=C.endTime) AND "+
					"(A.day<>D.day OR A.endTime<=D.starttime OR A.startTime>=D.endTime) AND "+
					"(A.day<>D.day OR A.endTime<=D.starttime OR A.startTime>=D.endTime) AND "+
					"(C.day<>D.day OR C.endTime<=D.starttime OR C.startTime>=D.endTime)) AS T)";
			String where =" WHERE T.firstClass> '"+taken[0]+"1' AND T.secondClass> '"+taken[1]+"1' AND T.third> '"+taken[2]+"1' AND T.fourth> '"+taken[3]+"1';";
      System.out.println(select+query+where);
HashSet<HashSet<String>> hs = new HashSet<>();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(select+query+where); 
			while (rs.next()) {
				HashSet<String> toAdd= new HashSet<>();
			    toAdd.add( rs.getString("firstClass"));
			   toAdd.add( rs.getString("secondClass"));
			    toAdd.add(rs.getString("third"));
			  toAdd.add(rs.getString("fourth"));
			  if(toAdd.size()==4) {
				  hs.add(toAdd);
			  }
			    
			}
					for(HashSet<String> combo: hs) {
						for(String course: combo) {
							System.out.print(course+ " | ");
						}
						System.out.println();
					}
			}
			catch(Exception e){ System.out.println(e);}  
	}
public static void main(String args[]){  
	System.out.println("Please, enter the 4 departments where you would like to; take classes separated by commas");
	  Scanner s1 = new Scanner(System.in);
	  String departments =s1.nextLine();
	 // System.out.println(departments);
	  System.out.println("Please, enter the highest class you have taken in each of them separated by commas");
	  Scanner s2= new Scanner(System.in);
	  String classes=s2.nextLine();
	  String [] arr= departments.split(",", 0);
	  String taken[]=classes.split(",",0);
	  
	for(int i=0;i<taken.length;i++) {
		System.out.print(taken[i]+" ");
	}
	
	queryMethod(arr, taken);

}  }
