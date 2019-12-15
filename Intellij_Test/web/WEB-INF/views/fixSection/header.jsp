<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-06
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Banner -->
<div class="banner">
    <div class="banner-text">
        <h1>Planer Community
        </h1>
        <h5>계획적으로 사는 사람들의 작은 공간</h5>
    </div>
</div>

<div class="navigation bg-dark">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark monkey-max-width">
        <button aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation"
                class="navbar-toggler" data-target="#navbarNavAltMarkup" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-start ml-md-auto " id="navbarNavAltMarkup">
            <div class="navbar-nav row">
                <a class="nav-item nav-link horizontal-line" href="/" id="sub1_Tab">메인</a>
                <!--<a class="nav-item nav-link" aria-disabled="true" style="padding: 0px;">|</a>-->
                <a class="nav-item nav-link horizontal-line" href="/sub2_Tab" id="sub2_Tab">인증</a>
                <a class="nav-item nav-link horizontal-line" href="/sub3_Tab" id="sub3_Tab">베스트 계획</a>
                <a class="nav-item nav-link horizontal-line" href="/board" id="board">월간 계획</a>
                <a class="nav-item nav-link horizontal-line" href="/move/parallax" id="parallax">플랜더 모임</a>
            </div>
        </div>
        <div class="collapse navbar-collapse justify-content-end ml-md-auto" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <div class="navar-nav row">
                    <a class="nav-item nav-link horizontal-line" href="#" style="margin-right: 10px;"> 제작자 </a>
            </div>
            </div>
        </div>
    </nav>
</div>

<div class="alerts">
    <div id="login-alert-input-null" class="alert alert-danger monkey-max-width" role="alert">
        <strong>아이디 또는 패스워드를 적어주세요.</strong>
    </div>
    <div id="login-alert-wrong-id" class="alert alert-danger monkey-max-width" role="alert">
        <strong>계정이 존재하지 않습니다.</strong> &nbsp;&nbsp; 아이디를 다시 확인하거나 계정찾기를 해주세요.
    </div>
    <div id="login-alert-wrong-pw" class="alert alert-danger monkey-max-width" role="alert">
        <strong>패스워드가 틀립니다.</strong>
    </div>
</div>