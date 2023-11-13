<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>공지사항 관리</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">공지사항 관리</h1>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <button type="button" class="btn btn-outline btn-primary pull-right">
                        <i class="fa fa-edit fa-fw"></i> 공지사항 작성
                    </button>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">공지사항</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="announcement" items="${announcements}"><!-- Assuming 'announcements' is the list of SupportDto objects -->
                            <tr>
                                <td>${announcement.annNo}</td>
                                <td>${announcement.annTitle}</td>
                                <td>${announcement.annDate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
