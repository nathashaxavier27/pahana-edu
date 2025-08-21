<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login");
    return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bills - Pahana Edu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: white;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #e0e0e0;
        }

        .container {
            padding: 2rem 1rem;
        }

        .page-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 700;
            background: rgba(30, 30, 30, 0.95);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 0.5rem;
        }

        .page-subtitle {
            color: #b0b0b0;
            font-size: 1.1rem;
            font-weight: 300;
        }

        .table-container {
            background: rgba(30, 30, 30, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px 0 rgba(0, 0, 0, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.08);
            padding: 2rem;
            margin: 2rem 0;
        }

        .table {
            margin: 0;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.6);
            color: #e0e0e0;
        }

        .table thead th {
          
            color: #ffffff;
            border: none;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 1rem;
            font-size: 0.9rem;
        }

        .table tbody tr {
            transition: all 0.3s ease;
            border: none;
        }

        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.05);
            transform: scale(1.01);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }

        .table tbody td {
            padding: 1rem;
            border-color: rgba(255, 255, 255, 0.08);
            vertical-align: middle;
            font-weight: 500;
        }

        .table tbody tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .btn {
            border-radius: 25px;
            font-weight: 600;
            padding: 0.5rem 1.2rem;
            transition: all 0.3s ease;
            border: none;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.8rem;
        }

        .btn-warning {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(240, 147, 251, 0.6);
            color: white;
        }

        .btn-danger {
            background: linear-gradient(135deg, #ff6a6a 0%, #ff1744 100%);
            color: white;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(255, 87, 87, 0.6);
            color: white;
        }

        .btn-primary {
            background: linear-gradient(135deg, #0072ff 0%, #00c6ff 100%);
            border: none;
            padding: 1rem 2rem;
            font-size: 1rem;
            margin-top: 1rem;
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(0, 114, 255, 0.5);
            color: white;
        }

        .btn-sm {
            margin: 0 0.25rem;
            padding: 0.4rem 1rem;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
            font-weight: 600;
            color: #4caf50;
        }

        .actions-cell {
            white-space: nowrap;
            text-align: center;
        }

        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #aaaaaa;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }
        
        .stock-low {
            color: #ff5252;
            font-weight: bold;
        }
        
        .stock-medium {
            color: #ffb300;
            font-weight: bold;
        }
        
        .stock-high {
            color: #4caf50;
            font-weight: bold;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem 0.5rem;
            }
            
            .table-container {
                padding: 1rem;
                margin: 1rem 0;
            }
            
            .page-title {
                font-size: 2rem;
            }
            
            .table {
                font-size: 0.9rem;
            }
            
            .btn-sm {
                padding: 0.3rem 0.8rem;
                font-size: 0.7rem;
                margin: 0.1rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <div class="container">
        <div class="page-header">
            <h1 class="page-title">Billing Management</h1>
             <a href="bill?action=create" class="btn btn-primary">Create New Bill</a>
        </div>
        
        <div class="table-container">
            <c:choose>
                <c:when test="${not empty bills}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Bill ID</th>
                                <th>Customer</th>
                                <th>Account #</th>
                                <th>Bill Date</th>
                                <th>Due Date</th>
                                <th>Amount (LKR)</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="bill" items="${bills}">
                                <tr>
                                    <td>${bill.billId}</td>
                                    <td>${bill.customer.name}</td>
                                    <td>${bill.customer.accountNumber}</td>
                                    <td><fmt:formatDate value="${bill.billDate}" pattern="yyyy-MM-dd" /></td>
                                    <td><fmt:formatDate value="${bill.dueDate}" pattern="yyyy-MM-dd" /></td>
                                    <td class="text-right">${bill.totalAmount}</td>
                                    <td>
                                        <span class="status-badge status-${bill.status.toLowerCase()}">${bill.status}</span>
                                    </td>
                                    <td class="actions-cell">
                                        <a href="bill?action=view&id=${bill.billId}" class="btn btn-info btn-sm">View</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div style="font-size: 4rem; margin-bottom: 1rem; opacity: 0.3;"><i class="fas fa-file-invoice-dollar"></i></div>
                        <h3>No Bills Found</h3>
                        <p>Start by creating your first bill for a customer.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="text-center">
          
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>