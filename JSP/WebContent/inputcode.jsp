<%@ page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OCES</title>
</head>
<body align  = "center" bgcolor="#E6E6FA">
<b>INPUT - CODE</b> 
<br>
<table align="center"> 

<td>input.txt:<br> 
<textarea name='ss' readonly="readonly" id='s' style="width:400px;height:400px;">
x
a
t
f
a
s
f
g
h
j
n
v
x
z
s
d
f
g
b
s
c
d
e
d
d
</textarea>
</td>
<td>

code.java:<br>
<textarea name='input' readonly="readonly" id='test' style="width:600px;height:400px;">
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.io.FileWriter;

public class code{

	public static void main(String[] args) {


		try (BufferedReader br = new BufferedReader(new FileReader(args[0])))
		{
			
			 // to get text's number of lines 
			int lines = 0;
			while (br.readLine() != null) lines++;
			
			
			
			//to read and sort the text
			String sCurrentLine;
			BufferedReader br2 = new BufferedReader(new FileReader(args[0])); 
			
			String[] array; //create a new array
			array = new String[lines];
		
			//fill array with text content
			int i=0;
			while ((sCurrentLine = br2.readLine()) != null) {
				array[i] = sCurrentLine;
				i++;
			}
			Arrays.sort(array); //sort array
			
			
			
			 //write content of the array to file
			FileWriter fw = new FileWriter("output.txt");
	
			for (i = 0; i < array.length; i++) {
				fw.write(array[i] + System.lineSeparator());
			}
			fw.close();
			
			
			System.out.println("Process is finished.");
			

		} catch (IOException e) {
			e.printStackTrace();
		} 

	}
}
</textarea></td>
</table>
<br>
<div align="center">In your computer if you try this code, you should run like this in command line:<br>
<textarea name='input' readonly="readonly" id='test' style="width:200px;height:50px;">
>javac code.java
>java code input.txt
</textarea>
<br>
You should have input.txt in your current directory.<br><br>
<a href="about.jsp">Go back.</a>
 </div>

</body>
</html>