<%@ page errorPage="error.jsp" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<style>

section {
    width: 90%;
    height: 100%;
    padding: 1px;
}
div#one {
    width: 0%;
    height: 150px;
    float: left;
}
div#two {
    margin-left: 50%;
    height: 150px;
}
</style>    
        <title>OCES</title>
  
</head>
<body bgcolor="#E6E6FA">
<jsp:useBean id="b" scope="session" class="bean.comprun"/>
<form action=problem.jsp method=post> 
    <h1 align="center">Problem Page</h1>
    <div id="one">  
    
   
	<br>
	<input type="file" name="datafile" id="fileInput" size="40">
    <label for="ta1">Input:</label>
    <textarea name="instructorinputfile" id="ta1" style="width: 400px; height: 150px;" ><%=b.viewtext("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorinput.txt") %></textarea><br>
    
    <input type="file" name="datafile2" id="fileOutput" size="40">
    <label for="ta2">Output:</label>
    <textarea id="ta2" style="width: 400px; height: 150px;" ><%=b.viewtext("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructoroutput.txt") %></textarea>
    <input type="submit" value="Generate Output From the Code" /> <br><br>
    <input type="button" value="Save" /></div>
    
    
    <div id="two"> 
<br>
    <input type="file" name="datafile3" id="fileCode" size="40"> <br>
    <label for="ta3">Code:</label><br>
    <textarea name=instructorcode id="ta3" style="width: 600px; height: 420px;" ><%=b.viewtext("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorcode.java") %></textarea>
    </div>
    
</section>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

	<table>
	<td>
	<input type="button" value="Create another problem" />
	</td>
	<td>
	<textarea id="ta4" style="width: 200px; height: 20px;" ></textarea>
	</td>
	</table>
	
</body>
	
  <jsp:setProperty property="*" name="b"  />
	 
	  <%
	//  	b.setInstructorinputfile("");
	 // 	b.setInstructorcode("");
	 if(b.getInstructorinputfile() != null && b.getInstructorcode() != null){
	 	b.DosyayaYaz(b.getInstructorinputfile(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorinput.txt");
   		b.DosyayaYaz(b.getInstructorcode(),"D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorcode.java");
   		b.withoutcompilefile("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse","instructorcode","instructorinput.txt");
   		
	 }
   		
   %>

</form>


<script>
 window.onload = function() {
		
var fileInput = document.getElementById('fileInput');
var fileInput2 = document.getElementById('fileOutput');
var fileInput3 = document.getElementById('fileCode');
		
		
var InputDisplayArea = document.getElementById('ta1');
var OutputDisplayArea = document.getElementById('ta2');
var CodeDisplayArea = document.getElementById('ta3');

		
fileInput.addEventListener('change', function(e) {
			
var file = fileInput.files[0];

			var textType = /text.*/;

			

				var reader = new FileReader();

	
			reader.onload = function(e) {
					
InputDisplayArea.innerText = reader.result;
				}
				reader.readAsText(file);	
		});
		
		
		
fileInput2.addEventListener('change', function(e) {
	
	var file = fileInput2.files[0];

				var textType = /text.*/;
				var reader = new FileReader();
				reader.onload = function(e) {
						
	OutputDisplayArea.innerText = reader.result;
					}


					reader.readAsText(file);	
				

			});
			
fileInput3.addEventListener('change', function(e) {
	
	var file = fileInput3.files[0];

				var textType = /text.*/;
				var reader = new FileReader();
				reader.onload = function(e) {
						
	CodeDisplayArea.innerText = reader.result;
					}


					reader.readAsText(file);	
				

			});			
			
}

</script>



</html>
