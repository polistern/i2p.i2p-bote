<%--
 Copyright (C) 2009  HungryHobo@mail.i2p
 
 The GPG fingerprint for HungryHobo@mail.i2p is:
 6DD3 EAA2 9990 29BC 4AD2 7486 1E2C 7B61 76DC DC12
 
 This file is part of I2P-Bote.
 I2P-Bote is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 I2P-Bote is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with I2P-Bote.  If not, see <http://www.gnu.org/licenses/>.
 --%>

<%@ attribute name="dirName" required="true" description="The directory used by the folder" %>
<%@ attribute name="displayName" required="true" description="The display name for the folder" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ib" uri="I2pBoteTags" %>

<c:set var="numEmails" value="${ib:getMailFolder(dirName).numElements}"/>
<c:set var="numNew" value="${ib:getMailFolder(dirName).numNewEmails}"/>

<c:choose>
    <c:when test="${dirName eq 'Outbox'}">
        <a href="outbox.jsp" target="_parent" title="${numEmails} emails total, ${numNew} new">
            <img src="images/folder.png"/>${displayName}
        </a>
    </c:when>
    <c:otherwise>
        <a href="folder.jsp?path=${dirName}" target="_parent" title="${numEmails} emails total, ${numNew} new">
            <img src="images/folder.png"/>${displayName}
        </a>
    </c:otherwise>
</c:choose>

<c:if test="${numNew>0}">(${numNew})</c:if>