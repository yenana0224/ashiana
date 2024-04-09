<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/Asihana/resources/css/customer/qnaDetail.css">
</head>
<body>

	<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
	<div id="qnaMark">
		<p>Q & A</p>
	</div>
	
	<div id="qnaBox">

		<div id="titleBox">
			<p>${ qna.qnaTitle }</p>
		</div>
		
		<div id="dateBox">
			<label style="font-size: 12px;">작성일</label>
			<p>${ qna.createDate }</p>
		</div>
		
		<div id="qnaText">
			<p>${ qna.qnaContent }</p>
		</div>
		
		<div id="downloadBox">
			<c:choose>
				<c:when test="${ qnaFile ne null }">
					<label>첨부파일 / </label> 
					<a download="${ qnaFile.changeName }" href="${ path }/${ qnaFile.filePath }/${ qnaFile.changeName }">
						${ qnaFile.originName }
					</a>
				</c:when>
				<c:otherwise>
					<label>첨부파일 / </label><a> 존재하는 파일이 없습니다.</a>
				</c:otherwise>
			</c:choose>
		</div>
		
		<c:set var="qnaUserNo" value="${ Integer.parseInt(qna.qnaWriter) }"></c:set>
		
		<div id="buttonBox">
			<button class="btn btn-sm btn-secondary" id="backbutton">목록</button>
			<c:choose>
				<c:when test="${ (sessionScope.loginUser ne null) and (sessionScope.loginUser.userNo eq qnaUserNo) }">
					<button class="btn btn-sm btn-danger" id="deleteButton">삭제</button>
					<button class="btn btn-sm btn-success" id="updateButton">수정</button>
				</c:when>
			</c:choose>
		</div>

		<div class="modal">
			<div class="modal_overlay">
				<div class="modal_content">
					<h4>삭제 하시겠습니까?</h4>
					<button id="cancel">취소</button>
					<button onclick="location.href='${ path }/qnaDelete.customer?qnaNo=${ qna.qnaNo }&qnaFileNo=${ (qnaFile ne null) ? qnaFile.boardNo : 0}&currentPage=${ currentPage }'">확인</button>
				</div>
			</div>
		</div>

		<c:choose>
			<c:when test="${ sessionScope.loginUser ne null }">
				<div id="replyText">
					<textarea name="reply" id="reply" cols="90" rows="8"></textarea>
					<button id="replyInsert">작 성</button>
					<button id="replyUpdate" style="display: none;">수 정</button>
					<div id="counter">(0 / 150)</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="replyText">
					<textarea name="reply" cols="90" rows="8"
						style="font-size: 20px; color: lightgray; text-align: center; line-height: 100px"
						readonly>로그인 후 이용해주세요</textarea>
					<button id="replyInsert">작 성</button>
					<div id="counter">(0 / 150)</div>
				</div>
			</c:otherwise>
		</c:choose>
		
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
		$('#updateButton').on('click', function(){
			location.href="${ path }/updateQaView.customer?qnaNo=${ qna.qnaNo }&currentPage=${ currentPage }"		
		});
		// 목록버튼 클릭시 이동
		$('#backbutton').on('click',function(){
			location.href="${ path }/qa.customer?currentPage=${ currentPage }"
		});
		// 삭제버튼 클릭시 모달창 
		$('#deleteButton').on('click',function(){
			$('.modal').css('display', 'block');
		});
		// 모달 취소버튼 클릭시 모달없애기
		$('#cancel').on('click',function(){
			$('.modal').css('display', 'none');
		})
	</script>
	
	<script>
		let loginUser = '${ sessionScope.loginUser.nickName }';
		let qnaNo = ${ qna.qnaNo };
		let userNo = '${ sessionScope.loginUser.userNo }';
		let qnaStatus = '${ qna.qnaStatus }';
		
		$('textarea').on('keydown', function(e){
			let str = $(this).val();
			let regExp = /[<>+_\-@#&|\\;]/ig;
			
			if(regExp.test(str)){
				alert('사용할 수 없는 특수 문자입니다.');
				str = str.replace(regExp, '');
				$(this).val(str);
			}
		})
		$('textarea').on('keyup', function(e){
			let str = $(this).val();
			let regExp = /[<>+_\-@#&|\\;]/ig;
			
			if(regExp.test(str)){
				alert('사용할 수 없는 특수 문자입니다.');
				str = str.replace(regExp, '');
				$(this).val(str);
			}
		})
		
		// 전체 댓글 확인 함수
		function selectReplyList(){
			
			console.log(loginUser)
			$.ajax({
				url: 'replyList.yo',
				data: {qnaNo : qnaNo},
				success: function(result){
							let resultStr = '';
							for(let i in result){
								let name = result[i].nickName;
								let comment = result[i].replyComment;
								let replyNo = result[i].replyNo;
								let replyName = result[i].nickName;
								let nickName = loginUser;
								
								if(loginUser !== null){
									if(nickName === replyName){
										
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
								}
								else{
										resultStr += '<div class="answer">'
												  +'<span class="answerName"><label style="color:red;">Name</label>' + " " + name  + '</span>'
				                      		  	  +	'<div class="answerTextBox"><pre class="answerText">' + comment + '</pre></div>'
												  + '</div>'
								}
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
							qnaNo : qnaNo,
							content : $('#reply').val(),
							userNo : loginUser !== null ? userNo : null,
							qnaStatus : qnaStatus
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
			if(confirm('삭제를 원하시면 확인을 눌러주세요')){
				
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
			}
			
		});
		
	</script>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>