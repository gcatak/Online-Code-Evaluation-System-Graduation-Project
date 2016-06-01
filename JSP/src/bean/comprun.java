package bean;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Timer;

import javax.servlet.SingleThreadModel;
import javax.tools.DiagnosticCollector;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;


public class comprun {
	private String inputfile ; 
	private String code;
	private String instructorinputfile;
	private String instructorcode;
	
	public String getInputfile(){
		return inputfile;
	}
	
	public void setInputfile(String i){
	        this.inputfile=i;
	    }
	  
	public String getCode(){
		  return code;
	  }
	
	public void setCode(String i){
		  this.code=i;
	  }
	
	
	public String getInstructorinputfile(){
		return instructorinputfile;
	}
	
	public void setInstructorinputfile(String i){
		this.instructorinputfile=i;
	}
	
	public String getInstructorcode(){
		return instructorcode;
	}
	
	public void setInstructorcode(String i){
		this.instructorcode=i;
	}
	

	String a;

	public static String compilefile(String path1,String name,String input) throws IOException{
		
		 String out = "";
		 System.setProperty("java.home", "C:\\Program Files\\Java\\jdk1.8.0_45");
		
		 JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
		 DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<>();
		 StandardJavaFileManager fileManager = compiler.getStandardFileManager(diagnostics, null, null);
		 Iterable<? extends JavaFileObject> compilationUnits = fileManager.getJavaFileObjectsFromStrings(Arrays.asList(path1 + "\\" + name + ".java"));
		 JavaCompiler.CompilationTask task = compiler.getTask(null, fileManager, diagnostics, null,
		         null, compilationUnits);
		 boolean success = task.call();
		 fileManager.close();
		 int compilationResult = compiler.run(null, null, null, path1 + "\\" + name +".java");
		 
		 final String dosCommand = "cmd /c java -cp ";
		 
		 
		 try {
		
		     final Process process = Runtime.getRuntime().exec("cmd /c java -cp " + path1 + " " + name + " " +input);
		     final InputStream in = process.getInputStream();
		     final InputStream in2 = process.getErrorStream();
		     int ch, ch2;
		    
		     while ((ch = in.read()) != -1) {
		        System.out.print((char) ch);
		         out = out + (char) ch;

		     }
		     
		     while ((ch2 = in2.read()) != -1) {
		        System.out.print((char) ch2); // read error here
		    	 out = out + (char) ch;
		     }
		 } catch (IOException e) {
		     e.printStackTrace();
		 }
		
	return out;	 
	
		 	 
	}
	
	public static void withoutcompilefile(String path1,String name,String input) throws IOException{

	
		 System.setProperty("java.home", "C:\\Program Files\\Java\\jdk1.8.0_45");
		
		 JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
		 DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<>();
		 StandardJavaFileManager fileManager = compiler.getStandardFileManager(diagnostics, null, null);
		 Iterable<? extends JavaFileObject> compilationUnits = fileManager.getJavaFileObjectsFromStrings(Arrays.asList(path1 + "\\" + name + ".java"));
		 JavaCompiler.CompilationTask task = compiler.getTask(null, fileManager, diagnostics, null,
		         null, compilationUnits);
		 boolean success = task.call();
		 fileManager.close();
		 int compilationResult = compiler.run(null, null, null, path1 + "\\" + name +".java");
		 
		 final String dosCommand = "cmd /c java -cp ";
		 
		 try {
		
		     final Process process = Runtime.getRuntime().exec("cmd /c java -cp " + path1 + " " + name + " " +input);
		     final InputStream in = process.getInputStream();
		     final InputStream in2 = process.getErrorStream();
		     int ch, ch2;
		    
		     while ((ch = in.read()) != -1) {
		        System.out.print((char) ch);
		   

		     }
		     
		     while ((ch2 = in2.read()) != -1) {
		        System.out.print((char) ch2); // read error here
		    
		     }
		 } catch (IOException e) {
		     e.printStackTrace();
		 }
	
		 	 
	}
	
	public static void deletefiles(){
		
		try{
		File file = new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\input.txt");
		File file2= new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\output.txt");
		File file3= new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\code.java");
		File file4= new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\code.class");
   
        	
    		if(file.delete()){
    			System.out.println(file.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
    		

    		

    		if(file3.delete()){
    			System.out.println(file3.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
    		

    		if(file4.delete()){
    			System.out.println(file4.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
    		//System.exit(0);

    		/*FileWriter f2 = null;
    		f2 = new FileWriter(file2);
    		
    		
    		f2.flush();
    		f2.close();*/
    	//	file2.delete();
    		if(file2.delete()){
    			System.out.println(file2.getName() + " is deleted!");
    		}
    		else{
    			System.out.println("Delete operation is failed.");
    		}
    	   
    	}catch(Exception e){
    		
    		e.printStackTrace();
    		
    	}
	}
	
	
	
public static void deletefilesins(){
		
		try{
		File file = new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorinput.txt");
		File file2= new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructoroutput.txt");
		File file3= new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorcode.java");
		File file4= new File("D:\\eclipse-jee-mars-R-win32-x86_64\\eclipse\\instructorcode.class");
   
        	
    		if(file.delete()){
    			System.out.println(file.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
    		

    		

    		if(file3.delete()){
    			System.out.println(file3.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
    		

    		if(file4.delete()){
    			System.out.println(file4.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
    		//System.exit(0);

    		/*FileWriter f2 = null;
    		f2 = new FileWriter(file2);
    		
    		
    		f2.flush();
    		f2.close();*/
    	//	file2.delete();
    		if(file2.delete()){
    			System.out.println(file2.getName() + " is deleted!");
    		}
    		else{
    			System.out.println("Delete operation is failed.");
    		}
    	   
    	}catch(Exception e){
    		
    		e.printStackTrace();
    		
    	}
	}
	 public static void DosyayaYaz(String input,String path) throws IOException{
		    FileWriter file = new FileWriter(path);
		    BufferedWriter writer = new BufferedWriter(file);
		    writer.write(input);
		    writer.close();     
		}
	 
	 
	 public static String viewtext(String pathname) throws IOException{
		 
		 
		 String a="";
		/* FileReader f = new FileReader(pathname);
		// BufferedWriter writer1 = new BufferedWriter()
		 BufferedReader bf = new BufferedReader*/
		 
		 File f = new File(pathname);
		 if(f.exists() && !f.isDirectory()) { 
		     BufferedReader br = new BufferedReader(new FileReader(pathname));
			  for (String line; (line = br.readLine()) != null;) {
				  a = a  +  line + System.lineSeparator()  ;
			      }
			  br.close();
		     return a;
		 }
		 else{
			// br.close();
			 return "Please try again, you should use our obligation rules to run your code correctly.";
	 }
	 
}
public static String viewtexti(String pathname) throws IOException{
		 
		 
		 String a="";
		/* FileReader f = new FileReader(pathname);
		// BufferedWriter writer1 = new BufferedWriter()
		 BufferedReader bf = new BufferedReader*/
		 
		 File f = new File(pathname);
		 if(f.exists() && !f.isDirectory()) { 
		     BufferedReader br = new BufferedReader(new FileReader(pathname));
			  for (String line; (line = br.readLine()) != null;) {
				  a = a  +  line + System.lineSeparator()  ;
			      }
			  br.close();
		     return a;
		 }
		 else{
			// br.close();
			 return "No file has generated yet.";
	 }
	 
}
}
