<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login");
    return;
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help - Pahana Edu Bookshop Management System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container {
            margin-top: 2rem;
            padding: 2rem 1rem;
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .page-title {
            font-size: 2.8rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
        }

        .page-subtitle {
            color: #6c757d;
            font-size: 1.2rem;
            font-weight: 300;
        }

        .help-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px 0 rgba(31, 38, 135, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.18);
            padding: 2.5rem;
            margin: 2rem 0;
        }

        .section-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: #667eea;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #667eea;
        }

        .subsection-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: #495057;
            margin: 1.5rem 0 1rem 0;
        }

        .feature-card {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1rem;
            border-left: 4px solid #667eea;
            transition: all 0.3s ease;
        }

        .feature-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.15);
        }

        .feature-icon {
            font-size: 2rem;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .step-number {
            display: inline-block;
            width: 30px;
            height: 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 30px;
            font-weight: 600;
            margin-right: 10px;
        }

        .contact-info {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
            padding: 2rem;
            margin-top: 2rem;
        }

        .quick-links {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin: 2rem 0;
        }

        .quick-link {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 25px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .quick-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(79, 172, 254, 0.3);
            color: white;
            text-decoration: none;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            margin-bottom: 2rem;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: #764ba2;
            text-decoration: none;
            transform: translateX(-5px);
        }

        .back-link::before {
            content: '←';
            margin-right: 0.5rem;
            font-size: 1.2rem;
        }

        .faq-item {
            margin-bottom: 1.5rem;
        }

        .faq-question {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .faq-answer {
            color: #6c757d;
            padding-left: 1.5rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem 0.5rem;
            }
            
            .help-container {
                padding: 1.5rem;
            }
            
            .page-title {
                font-size: 2.2rem;
            }
            
            .quick-links {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />
    
    <div class="container">
        <a href="item?action=list" class="back-link">Back to Dashboard</a>
        
        <div class="page-header">
            <h1 class="page-title">Pahana Edu Help Center</h1>
            <p class="page-subtitle">Comprehensive guide to using the Bookshop Management System</p>
        </div>
        
        <div class="help-container">
            <!-- Quick Action Links -->
            <div class="quick-links">
                <a href="item?action=list" class="quick-link">
                    <i class="fas fa-box me-2"></i>Manage Items
                </a>
                <a href="customer?action=list" class="quick-link">
                    <i class="fas fa-users me-2"></i>Manage Customers
                </a>
                <a href="bill?action=list" class="quick-link">
                    <i class="fas fa-file-invoice-dollar me-2"></i>View Bills
                </a>
                <a href="bill?action=create" class="quick-link">
                    <i class="fas fa-plus-circle me-2"></i>Create New Bill
                </a>
            </div>

            <!-- System Overview -->
            <div class="mb-5">
                <h2 class="section-title">System Overview</h2>
                <p>The Pahana Edu Bookshop Management System is designed to streamline operations for your bookstore. 
                   This comprehensive system handles inventory management, customer relationships, billing, and reporting.</p>
                
                <div class="row">
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-box"></i>
                            </div>
                            <h5>Inventory Management</h5>
                            <p>Track items, stock levels, categories, and pricing with real-time updates.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <h5>Customer Management</h5>
                            <p>Maintain customer database with account numbers, contact details, and purchase history.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-file-invoice"></i>
                            </div>
                            <h5>Billing System</h5>
                            <p>Generate professional invoices, track payments, and manage billing status.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Getting Started -->
            <div class="mb-5">
                <h2 class="section-title">Getting Started</h2>
                
                <h4 class="subsection-title">First Time Login</h4>
                <p><span class="step-number">1</span> Use the default admin credentials provided by your system administrator</p>
                <p><span class="step-number">2</span> Change your password after first login for security</p>
                
                <h4 class="subsection-title">Initial Setup</h4>
                <p><span class="step-number">1</span> Add your inventory items using the Item Management section</p>
                <p><span class="step-number">2</span> Register your existing customers in the Customer Management section</p>
                <p><span class="step-number">3</span> Configure your business settings (tax rates, company info, etc.)</p>
            </div>

            <!-- Module Guides -->
            <div class="mb-5">
                <h2 class="section-title">Module Guides</h2>
                
                <h4 class="subsection-title">Item Management</h4>
                <p><strong>Adding Items:</strong> Navigate to Items → Add New Item → Fill in details → Save</p>
                <p><strong>Editing Items:</strong> Click the Edit button next to any item → Modify details → Update</p>
                <p><strong>Stock Alerts:</strong> System automatically highlights low stock items in red</p>
                
                <h4 class="subsection-title">Customer Management</h4>
                <p><strong>Adding Customers:</strong> Each customer requires a unique account number</p>
                <p><strong>Viewing History:</strong> Click on any customer to view their purchase history</p>
                <p><strong>Search Function:</strong> Use the search bar to quickly find customers</p>
                
                <h4 class="subsection-title">Billing System</h4>
                <p><strong>Creating Bills:</strong> Select customer → Add items → Set quantities → Generate bill</p>
                <p><strong>Bill Status:</strong> Track bills as Pending, Paid, or Overdue</p>
                <p><strong>Printing:</strong> Use the print button to generate physical copies of invoices</p>
            </div>

            <!-- Frequently Asked Questions -->
            <div class="mb-5">
                <h2 class="section-title">Frequently Asked Questions</h2>
                
                <div class="faq-item">
                    <div class="faq-question">Q: How do I reset my password?</div>
                    <div class="faq-answer">A: Contact your system administrator for password reset assistance.</div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Q: Can I export data to Excel?</div>
                    <div class="faq-answer">A: Yes, most list pages have an export function in the top right corner.</div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Q: How do I handle returns or refunds?</div>
                    <div class="faq-answer">A: Create a negative quantity bill item to process returns.</div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Q: What should I do if the system is slow?</div>
                    <div class="faq-answer">A: Clear your browser cache and ensure you have a stable internet connection.</div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">Q: How often should I backup data?</div>
                    <div class="faq-answer">A: We recommend daily backups. The system automatically creates daily backups at midnight.</div>
                </div>
            </div>

            <!-- Troubleshooting -->
            <div class="mb-5">
                <h2 class="section-title">Troubleshooting</h2>
                
                <h4 class="subsection-title">Common Issues</h4>
                <p><strong>Login Issues:</strong> Check your internet connection and ensure cookies are enabled</p>
                <p><strong>Slow Performance:</strong> Clear browser cache or try using a different browser</p>
                <p><strong>Printing Problems:</strong> Ensure your printer is connected and has paper</p>
                
                <h4 class="subsection-title">Error Messages</h4>
                <p><strong>"Database Connection Error":</strong> Check your internet connection</p>
                <p><strong>"Invalid Session":</strong> Log out and log back in</p>
                <p><strong>"Page Not Found":</strong> Refresh the page or navigate using the menu</p>
            </div>

            <!-- Contact Support -->
            <div class="contact-info">
                <h3 class="text-center mb-3">Need Additional Help?</h3>
                <div class="row">
                    <div class="col-md-6">
                        <h5><i class="fas fa-envelope me-2"></i>Email Support</h5>
                        <p>support@pahanaedu.lk</p>
                        <p>Response time: Within 24 hours</p>
                    </div>
                    <div class="col-md-6">
                        <h5><i class="fas fa-phone me-2"></i>Phone Support</h5>
                        <p>+94 11 123 4567</p>
                        <p>Available: 8:00 AM - 6:00 PM (Weekdays)</p>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <p>For urgent issues, please call our support hotline</p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Expand/Collapse FAQ items
        document.querySelectorAll('.faq-question').forEach(question => {
            question.addEventListener('click', function() {
                const answer = this.nextElementSibling;
                answer.style.display = answer.style.display === 'none' ? 'block' : 'none';
            });
        });
    </script>
</body>
</html>