<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
    <title> ���� �ܾ� ������ v2.0 </title>
    <meta charset="UTF-8"/>
    <meta name="keywords" content="�λ��̴� ������� �����ܾ� �ܾ���� �����ܾ������">
	<meta name="description" content="�λ��̴� �� �ܾ ����ϴ� ��������� ���� ���� �ܾ� ������">
	<meta name="author" content="Jonathan Lee - jungdolpooh@gamil.com">
    <link rel="stylesheet" href="<%=this.getServletContext().getContextPath()%>/css/wordgen.css"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="<%=this.getServletContext().getContextPath()%>/js/jquery-3.4.1.min.js"></script>        
    <script src="<%=this.getServletContext().getContextPath()%>/js/wordgen.js"></script>        
    </head>

    <body>
    
        <div class="wrapper">
        
            <div id="menuDiv">
                <h1 id="picText">���� �ܾ�</h1>
            </div>

            <div id="btnDiv1">
                <a class="myButton" id="btnWordGen">�ܾ� �����</a>
            </div>
            <div id="btnDiv2">
                <a id="hidebtn" class="myButton" onclick="hide()">�����</a>
            </div>

            <div id="inputDiv">
                <input type="text" id="awinput" placeholder="�߰��� �ܾ �Է����ּ���" onkeypress="javascript:if(event.keyCode==13){addWordJsp()}" />
                <input type="button" id="addbtn" value="�߰�"/>
            </div>   
        </div>

        <div class="push"></div>
 

        <footer class="footer">
            <div id="mail">
                <label>jungdolpooh@gmail.com</label>
            </div>
        </footer>
        
        
        <script>                
        	$(document).ready(function() {
        		
    			$("#btnWordGen").click(function () {
//					alert("test");

					$.ajax ({
						  // URL�� �ʼ� ����̹Ƿ� �ݵ�� �����ؾ� �ϴ� Property�Դϴ�.
						  url	: "http://localhost:8080/<%=this.getServletContext().getContextPath()%>/randWord.do", // ��û�� ���۵� URL �ּ�
						  type	: "POST", // http ��û ��� (default: ��GET��)
						  contentType : "application/json", // ��û ����Ʈ Ÿ�� 
						  dataType    : "json", // ���� ������ ���� (������� ���� ��� �ڵ����� ����)

						  success : function(data, status, xhr) {
						    // ���������� ���� �޾��� ��쿡�� success �ݹ��� ȣ��ǰ� �˴ϴ�.
						    // �� �ݹ� �Լ��� �Ķ���Ϳ����� ���� �ٵ�, ���� �ڵ� �׸��� XHR ����� Ȯ���� �� �ֽ��ϴ�.						    
						    $("#picText").html(data.word);
						    
//						    debugger;
						  },
						  error	: function(xhr, status, error) {
						        // ������ ���� ���Ͽ��ٰų� �������� ���������� ������ ������ Ȯ���� �� ���� ������ 
						        // error �ݹ��� ȣ��� �� �ֽ��ϴ�.
						        // ���� ���, dataType�� �����ؼ� ���� ���� ������ ������ �����Ͽ�����,
						        // ���������� �ٸ� �������������� �����ϸ�  error �ݹ��� ȣ��ǰ� �˴ϴ�.
						  },
						  complete : function(xhr, status) {
						    // success�� error �ݹ��� ȣ��� �Ŀ� �ݵ�� ȣ��˴ϴ�.
						    // try - catch - finally�� finally ������ �����մϴ�.
						  }
					});					
					
    			});
    			
    			$("#addbtn").click( function() {		
    				addWordJsp();
    			} );
    			
    			
        	});
        	
        	
        	function addWordJsp(){
				var val = $("#awinput").val();				
				var dataObj = { "word" : val };				
				var data = JSON.stringify(dataObj);			
				
				$.ajax ({
					  // URL�� �ʼ� ����̹Ƿ� �ݵ�� �����ؾ� �ϴ� Property�Դϴ�.
					  url	: "http://localhost:8080/<%= this.getServletContext().getContextPath()%>/insertWord.do", // ��û�� ���۵� URL �ּ�
					  type	: "GET", // http ��û ��� (default: ��GET��)
					  contentType : "application/json", // ��û ����Ʈ Ÿ�� 
					  dataType    : "json", // ���� ������ ���� (������� ���� ��� �ڵ����� ����)
					  data	  : { word : val },
					  success : function(data, status, xhr) {
					    // ���������� ���� �޾��� ��쿡�� success �ݹ��� ȣ��ǰ� �˴ϴ�.
					    // �� �ݹ� �Լ��� �Ķ���Ϳ����� ���� �ٵ�, ���� �ڵ� �׸��� XHR ����� Ȯ���� �� �ֽ��ϴ�.						    
					    if (data.resultCode == "0000"){
					    	alert("���������� ����Ǿ����ϴ�.");					    	
					    }
					    else {
					    	alert("���忡 �����Ͽ����ϴ�. ���� �ڵ�:" + data.resultCode);					    						    						    	
					    }
					    
					    
//					    debugger;
					  },
					  error	: function(xhr, status, error) {
					        // ������ ���� ���Ͽ��ٰų� �������� ���������� ������ ������ Ȯ���� �� ���� ������ 
					        // error �ݹ��� ȣ��� �� �ֽ��ϴ�.
					        // ���� ���, dataType�� �����ؼ� ���� ���� ������ ������ �����Ͽ�����,
					        // ���������� �ٸ� �������������� �����ϸ�  error �ݹ��� ȣ��ǰ� �˴ϴ�.
					  },
					  complete : function(xhr, status) {
					    // success�� error �ݹ��� ȣ��� �Ŀ� �ݵ�� ȣ��˴ϴ�.
					    // try - catch - finally�� finally ������ �����մϴ�.
					  }
				});			        		        		
        	}        	
        
        </script>
    </body>


</html>