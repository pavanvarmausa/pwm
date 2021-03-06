<%--
 ~ Password Management Servlets (PWM)
 ~ http://www.pwm-project.org
 ~
 ~ Copyright (c) 2006-2009 Novell, Inc.
 ~ Copyright (c) 2009-2018 The PWM Project
 ~
 ~ This program is free software; you can redistribute it and/or modify
 ~ it under the terms of the GNU General Public License as published by
 ~ the Free Software Foundation; either version 2 of the License, or
 ~ (at your option) any later version.
 ~
 ~ This program is distributed in the hope that it will be useful,
 ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
 ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ~ GNU General Public License for more details.
 ~
 ~ You should have received a copy of the GNU General Public License
 ~ along with this program; if not, write to the Free Software
 ~ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--%>

<%@ page import="password.pwm.bean.TokenDestinationItem" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<% List<TokenDestinationItem> tokenDestinationItems = (List)JspUtility.getAttribute(pageContext, PwmRequestAttribute.ForgottenPasswordTokenDestItems); %>
<%@ page language="java" session="true" isThreadSafe="true" contentType="text/html" %>
<%@ taglib uri="pwm" prefix="pwm" %>
<html lang="<pwm:value name="<%=PwmValue.localeCode%>"/>" dir="<pwm:value name="<%=PwmValue.localeDir%>"/>">
<%@ include file="fragment/header.jsp" %>
<body class="nihilo">
<div id="wrapper">
    <jsp:include page="fragment/header-body.jsp">
        <jsp:param name="pwm.PageName" value="Title_ForgottenPassword"/>
    </jsp:include>
    <div id="centerbody">
        <h1 id="page-content-title"><pwm:display key="Title_ForgottenPassword" displayIfMissing="true"/></h1>
        <%@ include file="/WEB-INF/jsp/fragment/message.jsp" %>
        <p><pwm:display key="Display_RecoverTokenSendChoices"/></p>
        <table class="noborder">
            <tr>
                <td style="text-align: center">
                    <form action="<pwm:current-url/>" method="post" enctype="application/x-www-form-urlencoded" name="search" class="pwm-form">
                        <button class="btn" type="submit" name="submitBtn">
                            <pwm:if test="<%=PwmIfTest.showIcons%>"><span class="btn-icon pwm-icon pwm-icon-file-text"></span></pwm:if>
                            <pwm:display key="Button_Email"/>
                        </button>
                        <input type="hidden" name="choice" value="email"/>
                        <input type="hidden" name="processAction" value="<%=ForgottenPasswordServlet.ForgottenPasswordAction.tokenChoice%>"/>
                        <input type="hidden" name="pwmFormID" value="<pwm:FormID/>"/>
                    </form>
                </td>
                <td>
                    <pwm:display key="Display_RecoverTokenSendChoiceEmail"/>
                </td>
            </tr>
            <pwm:if test="<%=PwmIfTest.showMaskedTokenSelection%>">
                <tr>
                    <td>
                    </td>
                    <td>
                        <% for (final TokenDestinationItem item : tokenDestinationItems) { %>
                        <% if (item.getType() == TokenDestinationItem.Type.email) { %>
                        <%=item.getDisplay()%>
                        <% } %>
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </pwm:if>
            <tr>
                <td style="text-align: center">
                    <form action="<pwm:current-url/>" method="post" enctype="application/x-www-form-urlencoded" name="search" class="pwm-form">
                        <button class="btn" type="submit" name="submitBtn">
                            <pwm:if test="<%=PwmIfTest.showIcons%>"><span class="btn-icon pwm-icon pwm-icon-phone"></span></pwm:if>
                            <pwm:display key="Button_SMS"/>
                        </button>
                        <input type="hidden" name="choice" value="sms"/>
                        <input type="hidden" name="processAction" value="<%=ForgottenPasswordServlet.ForgottenPasswordAction.tokenChoice%>"/>
                        <input type="hidden" name="pwmFormID" value="<pwm:FormID/>"/>
                    </form>
                </td>
                <td>
                    <pwm:display key="Display_RecoverTokenSendChoiceSMS"/>
                </td>
            </tr>
            <pwm:if test="<%=PwmIfTest.showMaskedTokenSelection%>">
                <tr>
                    <td>
                    </td>
                    <td>
                        <% for (final TokenDestinationItem item : tokenDestinationItems) { %>
                        <% if (item.getType() == TokenDestinationItem.Type.sms) { %>
                        <%=item.getDisplay()%>
                        <% } %>
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </pwm:if>
            <tr>
                <td>
                    <%@ include file="/WEB-INF/jsp/fragment/forgottenpassword-cancel.jsp" %>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div class="push"></div>
</div>
<%@ include file="fragment/footer.jsp" %>
</body>
</html>

