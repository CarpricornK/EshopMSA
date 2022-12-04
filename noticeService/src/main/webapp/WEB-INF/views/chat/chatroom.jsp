<%@ page import="kopo.poly.util.CmmUtil" %><%--
  Created by IntelliJ IDEA.
  User: data18
  Date: 2022-09-14
  Time: 오전 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    String roomname = CmmUtil.nvl(request.getParameter("roomname"));

    String nickname = CmmUtil.nvl(request.getParameter("nickname"));
%>
<html>
<head>
    <style>
        .inputbox{
            width: 230px;
            height: 20px;
            position: fixed;
            bottom: 12px;
            left: 14px;
            border-radius: 5px;
            border-bottom: 1px solid white;
            border-top: 1px solid #252b37;
            border-left: 1px solid #252b37;
            border-right: 1px solid #252b37;
            outline: 0;
        }
    </style>
    <title><%=roomname%> 채팅방 입장</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
            crossorigin="anonymous"></script>

    <script type="text/javascript">
        let data = {};
        let ws;
        const roomname = "<%=roomname%>";
        const nickname = "<%=nickname%>";



        $(document).ready(function () {

            let btnSend = document.getElementById("btnSend");
            btnSend.onclick = function () {
                send();
            }

            console.log("openSocket");
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
                console.log("WebSocket is already opened.");
                return;
            }

            ws = new WebSocket("ws://" + location.host + "/ws/" + roomname + "/" + nickname);

            console.log(ws);

            ws.onopen = function (event) {
                if (event.data === undefined)
                    return;

                console.log(event.data)
                console.log(data.msg)
            };

            ws.onmessage = function (msg) {


                let data = JSON.parse(msg.data);



                if (data.name === nickname) {
                    $(".chat").append("<div>");
                    $(".chat").append("<span style='color: white'><b>[보낸 사람] : </b></span>");
                    $(".chat").append("<span style='color: white'> 나 </span>");
                    $(".chat").append("<span style='color: white'><b>[발송 메시지] : </b></span>");
                    $(".chat").append("<span style='color: white'> " + data.msg + " </span>");
                    $(".chat").append("<span style='color: white'><b>[발송시간] : </b></span>");
                    $(".chat").append("<span style='color: white'> " + data.date + " </span>");
                    $(".chat").append("</div>");
                    $.ajax({
                        url: "/papago/translate",
                        type: "get",
                        dataType: "JSON",
                        data: {
                            "text": data.msg
                        },
                        success: function (json) {

                            let text = json.text;
                            let translatedText = json.translatedText;
                            let tarLangType = json.tarLangType;
                            let tarLang = "";

                            if (tarLangType === "ko") {
                                tarLang = "한국어";
                            } else if (tarLangType === "en") {
                                tarLang = "영어";
                            }
                            $(".chat").append("<div>");
                            $(".chat").append("<span style='color: wheat'><b>[번역] : </b></span>");
                            $(".chat").append("<span style='color: wheat'> 나 </span>");
                            $(".chat").append("<span style='color: wheat'><b>[발송 메시지] : </b></span>");
                            $(".chat").append("<span style='color: wheat'> (원문) " + text +" </span>");
                            $(".chat").append("<span> => </span>");
                            $(".chat").append("<span> (" + tarLang + ") <b>" + translatedText + "</b> </span>");
                            $(".chat").append("<span style='color: wheat'><b>[발송시간] : </b></span>");
                            $(".chat").append("<span style='color: wheat'> " + data.date + " </span>");
                            $(".chat").append("</div>");
                        }
                    });

                } else if (data.name === "관리자") {
                    $(".chat").append("<div>");
                    $(".chat").append("<span style='color: red'><b>[보낸 사람] : </b></span>");
                    $(".chat").append("<span style='color: red'>" + data.name + "</span>");
                    $(".chat").append("<span style='color: red'><b>[발송 메시지] : </b></span>");
                    $(".chat").append("<span style='color: red'> " + data.msg + " </span>");
                    $(".chat").append("<span style='color: red'><b>[발송시간] : </b></span>");
                    $(".chat").append("<span style='color: red'> " + data.date + " </span>");
                    $(".chat").append("</div>");

                    $.ajax({
                        url: "/papago/translate",
                        type: "get",
                        dataType: "JSON",
                        data: {
                            "text": data.msg
                        },
                        success: function (json) {

                            let text = json.text;
                            let translatedText = json.translatedText;
                            let tarLangType = json.tarLangType;
                            let tarLang = "";

                            if (tarLangType === "ko") {
                                tarLang = "한국어";
                            } else if (tarLangType === "en") {
                                tarLang = "영어";
                            }
                            $(".chat").append("<div>");
                            $(".chat").append("<span style='color: orange'><b>[번역] : </b></span>");
                            $(".chat").append("<span style='color: orange'> data.name </span>");
                            $(".chat").append("<span style='color: orange'><b>[번역 내용] : </b></span>");
                            $(".chat").append("<span style='color: orange'> (원문) " + text +" </span>");
                            $(".chat").append("<span> => </span>");
                            $(".chat").append("<span> (" + tarLang + ") <b>" + translatedText + "</b> </span>");
                            $(".chat").append("<span style='color: orange'><b>[발송시간] : </b></span>");
                            $(".chat").append("<span style='color: orange'> " + data.date + " </span>");
                            $(".chat").append("</div>");
                        }
                    });
                } else {
                    $(".chat").append("<div>");
                    $(".chat").append("<span><b style='color: wheat'>[보낸 사람] : </b></span>");
                    $(".chat").append("<span style='color: wheat'>" + data.name + "</span>");
                    $(".chat").append("<span><b style='color: wheat'>[발송 메시지] : </b></span>");
                    $(".chat").append("<span style='color: wheat'> " + data.msg + " </span>");
                    $(".chat").append("<span><b style='color: wheat'>[발송시간] : </b></span>");
                    $(".chat").append("<span style='color: wheat'> " + data.date + " </span>");
                    $(".chat").append("</div>");

                    $.ajax({
                        url: "/papago/translate",
                        type: "get",
                        dataType: "JSON",
                        data: {
                            "text": data.msg
                        },
                        success: function (json) {

                            let text = json.text;
                            let translatedText = json.translatedText;
                            let tarLangType = json.tarLangType;
                            let tarLang = "";

                            if (tarLangType === "ko") {
                                tarLang = "한국어";
                            } else if (tarLangType === "en") {
                                tarLang = "영어";
                            }
                            $(".chat").append("<div>");
                            $(".chat").append("<span style='color: orange'><b>[번역] : </b></span>");
                            $(".chat").append("<span style='color: orange'> data.name </span>");
                            $(".chat").append("<span style='color: orange'><b>[번역 내용] : </b></span>");
                            $(".chat").append("<span style='color: orange'> (원문) " + text +" </span>");
                            $(".chat").append("<span> => </span>");
                            $(".chat").append("<span> (" + tarLang + ") <b>" + translatedText + "</b> </span>");
                            $(".chat").append("<span style='color: orange'><b>[발송시간] : </b></span>");
                            $(".chat").append("<span style='color: orange'> " + data.date + " </span>");
                            $(".chat").append("</div>");
                        }
                    });
                }

            }
        });

        function send() {
            let msgObj = $("#msg");

            if (msgObj.value !== "") {
                data.name = nickname;
                data.msg = msgObj.val();

                let temp = JSON.stringify(data);

                ws.send(temp);

                console.log("temp : "+temp)
            }
            msgObj.val("");
        }


    </script>
</head>
<body>
<h2 style="color: white"><%=nickname%>님! <%=roomname%> 채팅방 입장하셨습니다.</h2>

<div><b style="color: white">채팅내용</b></div>
<hr/>
<div class="chat"></div>
<div class="">
    <label style="color: white" for="msg"></label>

    <input class="inputbox" type="text" id="msg">
    <button id="btnSend" style="position: fixed; bottom:7px; right: 7px; background-color: #252b37; border:1px solid rgba(0, 0, 0, 0)">
        <img style="cursor:pointer; width: 28px; height: 28px; background-color: #252b37" src="https://cdn-icons-png.flaticon.com/512/1034/1034262.png">
    </button>
</div>


</body>
</html>
