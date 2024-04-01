<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.semi.customer.model.vo.* , java.util.ArrayList, java.util.List"%>
<%
	List<Answer> answer = (ArrayList<Answer>) request.getAttribute("answer");
	NoticeFile qnaFile = (NoticeFile) request.getAttribute("qnaFile");
	QNA qna = (QNA) request.getAttribute("qna");
	String currentPage = (String) request.getAttribute("currentPage");
	int qnaUserNo = Integer.parseInt(qna.getQnaWriter());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style>
	#qnaMark {
		margin: auto;
		padding-top: 20px;
		height: 150px;
		width: 1000px;
		text-align: center;
		line-height: 100px;
		font-size: 30px;
		font-weight: bold;
		text-shadow: 2px 2px rgba(128, 128, 128, 0.541);
		border-bottom: 1px solid rgba(0, 0, 0, 0.208);
	}
	
	#qnaBox {
		height: auto;
		width: 1000px;
		margin: auto;
		border-radius: 5px;
	}
	
	#titleBox {
		height: 50px;
		width: 100%;
		border-bottom: 1px solid rgba(0, 0, 0, 0.208);
		text-align: center;
		font-size: 20px;
		font-weight: 800;
	}
	
	#titleBox>P {
		margin-top: 20px;
	}
	
	#dateBox {
		height: 100px;
		text-align: right;
		padding-right: 30px;
	}
	
	#dateBox>p {
		margin-top: 2px;
		font-size: 15px;
		font-weight: bold;
		color: rgb(70, 68, 68);
	}
	
	#downloadBox {
		height: 50px;
		width: 700px;
		margin: auto;
		text-align: left;
		font-size: 15px;
		font-weight: 1000;
		line-height: 40px;
	}
	
	#qnaText {
		width: 700px;
		height: 400px;
		margin: auto;
		padding-top: 10px;
		border: 1px solid rgb(231, 225, 225);
		word-wrap: break-word;
	}
	
	#buttonBox {
		margin: auto;
		text-align: center;
		width: 100%;
		height: 100px;
		line-height: 100px;
	}
	
	#replyBox {
		margin: auto;
		width: 750px;
		height: 500px;
		max-height: 500px;
		overflow-y: auto;
		padding-bottom: 20px;
	}
	
	#replyText {
		width: 700px;
		height: 110px;
		margin: auto;
	}
	
	#replyText textarea {
		resize: none;
		width: 600px;
		height: 100%;
		box-sizing: border-box;
		border: 1px solid red;
		border-radius: 3px;
		font-size: 15px;
		font-weight: 400;
	}
	
	#replyText>button {
		width: 100px;
		height: 100%;
		float: right;
		background-color: red;
		border: none;
		color: white;
		font-size: 18px;
		font-weight: 1000;
		border-radius: 3px;
	}
	
	#reply:focus {
		outline: none;
	}
	
	#counter {
		font-size: 13px;
	}
	
	#replyLine {
		height: 30px;
		width: 700px;
		margin: auto;
		border-bottom: 0.5px solid rgba(0, 0, 0, 0.267);
		box-sizing: border-box;
	}
	
	#replySelect {
		width: 700px;
		height: 135px;
		margin: auto;
		box-sizing: border-box;
	}
	
	#replyAnswer {
		overflow-y: auto;
		max-height: 350px;
		padding-bottom: 20px;
	}
	
	.answer {
		width: 700px;
		margin: auto;
		height: 130px;
		box-sizing: border-box;
	}
	
	.answer a {
		position: relative;
		left: 90%;
		bottom: 50%;
		font-size: 12px;
		line-height: 100px;
		color: blue;
	}
	
	.answerTextBox {
		margin: auto;
		width: 700px;
		height: 100px;
		line-height: 70px;
		font-size: 15px;
		border-bottom: 0.5px solid rgba(0, 0, 0, 0.267);
		box-sizing: border-box;
	}
	
	.answer:last-child {
		margin-bottom: 0;
	}
	
	.answerName {
		font-size: 13px;
	}
	
	.answer a:hover {
		color: red;
	}
	
	.answerText {
		margin: auto;
		width: 650px;
		white-space: pre-wrap;
		line-height: 20px;
	}
	
	.modal {
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: none;
	}
	
	.modal_overlay {
		background-color: rgba(0, 0, 0, 0.090);
		width: 100%;
		height: 100%;
	}
	
	.modal_content {
		background-color: white;
		padding: 50px 100px;
		text-align: center;
		box-shadow: 0 10px 20px rgba(201, 169, 169, 0.998), 0 6px 6px
			rgba(201, 169, 169, 0.998);
		border-radius: 10px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	
	h4 {
		margin: 50;
		margin-bottom: 50px;
	}
	
	.modal_content>button {
		background-color: red;
		color: white;
		border: none;
		margin-left: 10px;
		width: 60px;
		height: 30px;
	}
</style>
</head>
<body>

	<%@ include file="../common/headerbar.jsp"%>

	<div id="qnaMark">
		<p>Q & A</p>
	</div>
	
	<div id="qnaBox">

		<div id="titleBox">
			<p><%=qna.getQnaTitle()%></p>
		</div>
		
		<div id="dateBox">
			<label style="font-size: 12px;">작성일</label>
			<p><%=qna.getCreateDate()%></p>
		</div>
		
		<div id="qnaText">
			<p><%=qna.getQnaContent()%></p>
		</div>
		
		<div id="downloadBox">
			<% if (qnaFile != null) {%>
			
				<label>첨부파일 / </label> 
				<a download="<%=qnaFile.getChangeName()%>" 
					href="<%=contextPath + "/" + qnaFile.getFilePath() + "/" + qnaFile.getChangeName()%>">
					<%=qnaFile.getOriginName()%>
				</a>
				
			<% } else { %>
			
				<label>첨부파일 / </label><a download=""> 존재하는 파일이 없습니다.</a>
			
			<% } %>
		</div>

		<div id="buttonBox">
			<button class="btn btn-sm btn-secondary" id="backbutton">목록</button>
			<% if (loginUser != null && loginUser.getUserNo() == qnaUserNo) { %>
				<button class="btn btn-sm btn-danger" id="deleteButton">삭제</button>
				<button class="btn btn-sm btn-success" id="updateButton">수정</button>
			<% } %>
		</div>

		<div class="modal">
			<div class="modal_overlay">
				<div class="modal_content">
					<h4>삭제 하시겠습니까?</h4>
					<button id="cancel">취소</button>
					<button onclick="location.href='<%=contextPath%>/qnaDelete.customer?qnaNo=<%=qna.getQnaNo()%>&qnaFileNo=<%=(qnaFile != null) ? qnaFile.getBoardNo() : 0%>&currentPage=<%=currentPage%>'">확인</button>
				</div>
			</div>
		</div>



		<% if (loginUser != null) { %>
		
			<div id="replyText">
				<textarea name="reply" id="reply" cols="90" rows="8"></textarea>
				<button id="replyInsert">작 성</button>
				<button id="replyUpdate" style="display: none;">수 정</button>
				<div id="counter">(0 / 150)</div>
			</div>
			
		<% } else { %>
		
			<div id="replyText">
				<textarea name="reply" cols="90" rows="8"
					style="font-size: 20px; color: lightgray; text-align: center; line-height: 100px"
					readonly>로그인 후 이용해주세요</textarea>
				<button id="replyInsert">작 성</button>
				<div id="counter">(0 / 150)</div>
			</div>
			
		<% } %>
		
		<div id="replyLine"></div>
		
		<div id="replyBox">
			<div id="replySelect"></div>
		</div>

	</div>

	<script>
		// comment 글자수 표시
		$('#reply').keyup(function (){
		    let content = $('#reply').val();
		    $('#counter').html("("+ content.length +" / 150)");
		
		    if (content.length > 150){
		        alert("최대 150자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 150));
		    }
		});
		// 수정버튼 클릭시 이동
		$('#updateButton').click(function(){
			location.href="<%=contextPath%>/updateQaView.customer?qnaNo=<%=qna.getQnaNo()%>&currentPage=<%=currentPage%>"
		});
		// 목록버튼 클릭시 이동
		$('#backbutton').click(function(){
			location.href="<%=contextPath%>/qa.customer?currentPage=<%=currentPage%>"
		});
		// 삭제버튼 클릭시 모달창 
		$('#deleteButton').click(function(){
			$('.modal').css('display', 'block');
		});
		// 모달 취소버튼 클릭시 모달없애기
		$('#cancel').click(function(){
			$('.modal').css('display', 'none');
		})
		
		// 전체 댓글 확인 함수
		function selectReplyList(){
			
			$.ajax({
				url: 'replyList.yo',
				data: {qnaNo : <%=qna.getQnaNo()%>},
				success: function(result){
							let resultStr = '';
							for(let i in result){
								let name = result[i].nickName;
								let comment = result[i].replyComment;
								let replyNo = result[i].replyNo;
								let replyName = result[i].nickName;
								let nickName = '<%=(loginUser != null) ? loginUser.getNickName() : ""%>';
								
								<%if (loginUser != null) {%>
								// 로그인했을때 
									if(nickName === replyName){
										// 유저닉네임과 댓글닉니임 비교
										resultStr += '<div class="answer">'
												  + '<input type="hidden" class="replyNo" value="'+replyNo+'">'
												  + '<span class="answerName"><label style="color:red;">Name</label>' + " " + name  + '</span>'
							                      +	'<div class="answerTextBox"><pre class="answerText">' + comment + '</pre></div>'
							                      + '<a class="replyUpdate">수정</a>  <a class="replyDelete">삭제</a>'
										     	  + '</div>';
									}
									else{
										resultStr += '<div class="answer">'
												  + '<span class="answerName"><label style="color:red;">Name</label>' + " " + name  + '</span>'
							                      +	'<div class="answerTextBox"><pre class="answerText">' + comment + '</pre></div>'
										     	  + '</div>';
									}
								<%} else {%>
								// 로그인 안 했을때
										resultStr += '<div class="answer">'
												  +'<span class="answerName"><label style="color:red;">Name</label>' + " " + name  + '</span>'
				                      		  	  +	'<div class="answerTextBox"><pre class="answerText">' + comment + '</pre></div>'
												  + '</div>'
								
								<%}%>
					};
					$('#replySelect').html(resultStr);
				}
			})
		}
		
		
		$(function(){
			selectReplyList();
		});
		
		// 댓글 작성 버튼 클릭시
		$('#replyInsert').click(function(){
			
			let blank = $('#reply').val().replace(/\s/gi, "").length;
			
			if(blank > 0){
				$.ajax({
					url: 'replyInsert.yo',
					type : 'post',
					data: {
							qnaNo : <%=qna.getQnaNo()%>,
							content : $('#reply').val(),
							<%if (loginUser != null) {%>
							userNo : <%=loginUser.getUserNo()%>,
							<%}%>
							qnaStatus : '<%=qna.getQnaStatus()%>'
						  },
					success : function(result){
									if(result == 'success'){
										$('#reply').val('');
										selectReplyList();
									}
									else{
										alert('작성실패')
									}
							   }  
				})
			}
			else{
				alert('작성할 댓글을 입력해주세요');
			}
			
		})
		
		// 댓글 수정 a태그 클릭 시
		$(document).on('click', '.replyUpdate', function(){
			
				let update = $(this).siblings('.answerTextBox').children('.answerText').text();
			    let replyNo = $(this).closest('.answer').find('.replyNo').val();
				$('#reply').val(update);
				$('#reply').text(replyNo);
				$('#replyInsert').css('display','none');
				$('#replyUpdate').css('display', 'block');
		})
		
		// 댓글 수정 버튼 클릭시 수정함수 호출
		$(document).on('click', '#replyUpdate', function() {
		    
			replyUpdate();
			
		});
		
		// 댓글 수정 함수
		function replyUpdate(){
			
			let replyNo = $('#reply').text();
			// 공백확인용
			let blank = $('#reply').val().replace(/\s/gi, "").length;
			// 빈문자일때 alert창
			if(blank > 0){
			$.ajax({
				url:'replyUpdate.yo',
				type: 'post',
				data: {
					  replyNo: replyNo,
					  content : $('#reply').val()
					  },
				success : function(result){
							if(result == 'success'){
								$('#reply').val('')
								$('#replyInsert').css('display','block');
								$('#replyUpdate').css('display', 'none');
								selectReplyList();
							}
							else{
							    alert('수정 실패');	
							}
					      }
			})
			}
			else{
				alert('수정할 문자를 입력해주세요')
			}
		}
		// 댓글 삭제 a태그 클릭 시
		$(document).on('click', '.replyDelete', function(){
			
			const replyNo = $(this).siblings('.replyNo').val();
			
			$.ajax({
				url:'replyDelete.yo',
				data:{
					 replyNo : replyNo
					},
			    success : function(result){
					    	if(result == 'success'){
						    	alert('삭제완료');
						    	$('#replyInsert').css('display','block');
								$('#replyUpdate').css('display', 'none');
								$('#reply').val('')
						    	selectReplyList();
					    	}
					    	else{
					    		alert('삭제실패')
					    	}
			    		   }
			})
		});
		
	</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>