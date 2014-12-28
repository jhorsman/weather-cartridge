<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"
         import="com.tridion.ambientdata.*, com.tridion.ambientdata.claimstore.*, java.net.*, java.util.*"%>

<html>
<head>
    <title>All Claims</title>
    <style>
        td{vertical-align:top;border-bottom:1px solid #444;border-right:1px solid #444;border-top:#888;border-left:#888;}
        th{background-color:#333;color:#ccc;}
        .odd{background-color:#eee;}
        .even{background-color:#ccc;}
        body,table{font-family:tahoma;font-size:11px;color:#444;}
    </style>
</head>
<body>

<table>
    <tr>
        <th colspan="3">Claims</th>
    </tr>
    <tr>
        <th>URI</th>
        <th>Type</th>
        <th>Value</th>
    </tr>
    <%!
        public String convertToString(Object object) {
            String result = object.toString();
            if (object instanceof Collection) {
                result = "<table>";
                int c = 0;
                for (Object o : (Collection)object) {
                    result += "<tr class='" + oddOrEven(c) + "'><td>" + o.toString() + "</td></tr>";
                    c++;
                }
                result += "</table>";
            }
            if (object instanceof String[]) {
                result = "<table>";
                int c = 0;
                for (Object o : (String[])object) {
                    result += "<tr class='" + oddOrEven(c) + "'><td>" + o.toString() + "</td></tr>";
                    c++;
                }
                result += "</table>";
            }
            if (object instanceof Map) {
                result = "<table>";
                int c = 0;
                for (String key : ((Map<String, Object>)object).keySet()) {
                    Object value = ((Map<String, Object>)object).get(key);
                    if (value instanceof String[]) {
                        result += "<tr class='" + oddOrEven(c) + "'><td>" + key + "</td><td>" + arrayToString((String[])value) + "</td></tr>";
                    } else if (value instanceof String) {
                        result += "<tr class='" + oddOrEven(c) + "'><td>" + key + "</td><td>" + value + "</td></tr>";
                    }
                    c++;
                }
                result += "</table>";

            }
            return result;
        }

        private String arrayToString(String[] array) {
            String result = "";
            for (String s : array) {
                result += " " + s;
            }
            return result;
        }

        private String oddOrEven(int c) {
            return c %2 == 1 ? "odd" : "even";
        }

    %>

    <%
        ClaimStore store = AmbientDataContext.getCurrentClaimStore();
        if (store != null) {
            Map<URI, Object> claims = store.getAll();
            int c = 0;
            for (URI claim : claims.keySet()) {
                Object claimValue = claims.get(claim);
                out.println("<tr class='" + oddOrEven(c) + "'>");
                out.println("<td>" + claim.toString() + "</td>");
                out.println("<td>" + (claimValue == null ? "null" : claimValue.getClass().getSimpleName()) + "</td>");
                out.println("<td>" + (claimValue == null ? "null" : convertToString(claims.get(claim))) + "</td>");
                out.println("</tr>");
                c++;
            }
        } else {
            out.println("<tr><td>no claimstore</td></tr>");
        }
    %>
</table>
<!-- Page Settings: {"PageID":"tcm:2-271-64","Modified":"2012-01-06T12:02:16"} -->
<script type="text/javascript" language="javascript" defer="defer" src="http://localhost/WebUI/Editors/SE/Views/Bootstrap/Bootstrap.aspx?mode=js" id="tridion.siteedit"></script>
</body>
</html>
