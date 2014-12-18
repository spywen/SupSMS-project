<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sup.sms.utils.ConversationFacade"%>
<%@page import="sup.sms.entity.Message"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="../include/header.jsp">
    <c:param name="title" value="Conversation" />
</c:import>
<c:import url="../menus/app_menu.jsp"/>
<c:import url="../include/notifications.jsp"/>

    <% List<ConversationFacade> conversations = (List<ConversationFacade>)request.getAttribute("conversations"); %>
    <% SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yy hh:mm"); %>

    <div id="conversation">
        <h1>Conversations</h1>
        <a href="/app/message" class="btn btn-default btn-lg">New message</a>
        <table class="table">
            <thead>
                <tr>
                <th>Contact</th>
                <th>Messages exchanged</th>
                <th>Last Message</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <% for(ConversationFacade c : conversations){ %>
                    <tr>
                        <td class="contact">
                            <span class="desc"><%= c.getContact() != null ? c.getContact().getFirstname() + " " + c.getContact().getLastname() : c.getUnknownContact() %></span>
                            <span class="phone">(<%= c.getUnknownContact() %>)</span>
                        </td>
                        <td class="messageCount cellContentCentered"><%= c.getMessageCount() %></td>
                        <td class="lastMessage">
                            <span class="message"><%= c.getLastMessage().getMessage().length() > 15 ? c.getLastMessage().getMessage().substring(0, 15) + "..." : c.getLastMessage().getMessage() %></span>
                            <span class="date"><%= " envoyé le " + formater.format(c.getLastMessage().getTransmissionDate()) %></span>
                             
                        </td>
                        <td class="cellContentCentered">
                            <form action="" method="POST">
                                <input type="hidden" value="see" name="type"/>
                                <input type="hidden" value="<%= c.getUnknownContact()%>" name="interlocutorPhoneNumber"/>
                                <input type="submit" value="See" class="btn btn-info btn-xs"/>
                            </form>
                        </td>
                    </tr>
                <%}%>
            </tbody>
        </table>
    </div>

<c:import url="/include/footer.jsp"/>
 