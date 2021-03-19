<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<title>글쓰기</title>
</head>
<body>
    <form id="frm" enctype="multipart/form-data" >
        <table class="board_view">
            <colgroup>
                <col width="15%" >
                <col width="*" >
            </colgroup>
            <caption>게시글 작성</caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text"  name="TITLE" class="wdp_90" /></td>
                </tr>
                <tr>
                    <th scope="row">내용</th>
                    <td><textarea cols="100" rows="20" id="CONTENTS" name="CONTENTS" title="내용"></textarea></td>
                </tr>
            </tbody>
        </table>
        <div id="fileDiv">
            <p>
                <input type="file" name="file_0"/>
                <a href="#this" name="delete" class="btn">삭제하기</a>
            </p> 
        </div>
         
 
 
        <a href="#this" id="add" class="btn">파일 추가하기</a>
        <a href="#this" id="list" class="btn">목록으로</a>
        <a href="#this" id="write" class="btn">글쓰기</a>
    </form>
    
    <script type="text/javascript">
        var g_count =1;
        $(document).ready(function(){
            $("#list").on("click",function(e){
                e.preventDefault();
                fn_openBoardList();
            })
            $("#write").on("click",function(e){
                e.preventDefault();
                fn_writeBoard();
            })
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));
            })
            $("#add").on("click",function(e){
                e.preventDefault();
                fn_fileAdd();
            })
        });
         
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
            comSubmit.submit();
        }
         
        function fn_writeBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/writeBoard.do'/>");
            comSubmit.submit();
        }
        function fn_fileDelete(obj){
            obj.parent().remove();
        }
        function fn_fileAdd(){
            var str = "<p><input type='file' name='file_"+(g_count++)+"'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
            $("#fileDiv").append(str);
             
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));         
            })
        }
    </script>
</body>
</html>