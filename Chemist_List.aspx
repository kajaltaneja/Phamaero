<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chemist_List.aspx.cs" Inherits="WebApplication2.Chemist_List" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHAMAERO "Your Medical Proctor"</title>
    <meta name="description" content="Search nearest chemist and medicines available." />
    <meta name="keywords" content="search medicine, nearest chemist, new medicines" />
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" />
    <link href="css/ChemistList.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <script src="js/modernizr.custom.js"></script>
    <script src="js/myscript.js"></script>


</head>
<body style="background-color: white;">
    <div class="container-fluid">
        <ul id="gn-menu" class="gn-menu-main">
            <li class="gn-trigger">
                <a class="gn-icon gn-icon-menu"><span>Menu</span></a>
                <nav class="gn-menu-wrapper">
                    <div class="gn-scroller">
                        <ul class="gn-menu">
                            <li class="gn-search-item">
                                <input placeholder="Search" type="search" class="gn-search">
                                <a class="gn-icon gn-icon-search"><span>Search</span></a>
                            </li>
                            <li>
                                <a class="gn-icon gn-icon-download">Downloads</a>
                                <ul class="gn-submenu">
                                    <li><a class="gn-icon gn-icon-illustrator">Vector Illustrations</a></li>
                                    <li><a class="gn-icon gn-icon-photoshop">Photoshop files</a></li>
                                </ul>
                            </li>
                            <li><a class="gn-icon gn-icon-cog">Settings</a></li>
                            <li><a class="gn-icon gn-icon-help">Help</a></li>
                            <li>
                                <a class="gn-icon gn-icon-archive">Archives</a>
                                <ul class="gn-submenu">
                                    <li><a class="gn-icon gn-icon-article">Articles</a></li>
                                    <li><a class="gn-icon gn-icon-pictures">Images</a></li>
                                    <li><a class="gn-icon gn-icon-videos">Videos</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </li>
            <li><a href="Default.aspx">SEARCH CHEMIST</a></li>
                <li><a href="Search_Med.aspx"><span>SEARCH MEDICINE</span></a></li>
                <li class="download_app"><a href="#download"><span>Download Our App</span></a></li>
        </ul>

    </div>
    <div class="container">
            <div class="row">
                <form>
                 <div class="col-md-2 col-xs-12" id="down">
                    <h3>Filters</h3>
                    <div>
                        <input id="radio-1" class="radio-custom" name="radio-group" type="radio" checked>
                        <label for="radio-1" class="radio-custom-label">Newly Launched</label>
                    </div>
                    <div>
                        <input id="radio-2" class="radio-custom" name="radio-group" type="radio">
                        <label for="radio-2" class="radio-custom-label">By Company</label>
                    </div>
                    <div>
                        <input id="radio-3" class="radio-custom" name="radio-group" type="radio">
                        <label for="radio-3" class="radio-custom-label">By Salt</label>
                    </div>
                  </div>
                </form>
                <div class="col-md-8 col-xs-12" id="down1">
                
                <form runat="server">
                    <asp:ListView ID="MedicineList" runat="server">
                        <LayoutTemplate>
                            <div class="mainbox">
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                            </div>
                        </LayoutTemplate>
                   
                        <ItemTemplate>
                            <div class="card">
                                <div class="col-md-2  col-sm-3 col-xs-12">
                                    <img class="small_size" src="https://scontent.fdel1-1.fna.fbcdn.net/hphotos-xaf1/v/t1.0-9/12308652_1036760799707516_2411208485220548322_n.jpg?oh=7aa27bfeba34363f3d24b4cb37365d55&oe=5712D3DC" alt="" />
                                </div>
                                <div class="col-md-7 col-sm-7 col-xs-12">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <h3>Name: <%#Eval("NAME") %></h3>
                                        
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <h3>Company: <%#Eval("COMPANY") %></h3>
                                        <%--<h3>MRP: <%#Eval("MRP") %></h3>--%>
                                    </div>
                                    
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12" style="margin-top:14%;">
                                    <div class="col-md-6 col-sm-6 col-xs-6"  >
                                        <a class="btn btn-default text-left" style="min-width: 70px; text-align: justify; float: right; margin-right:-17%;">
                                            <span class="icon-small-12">
                                                <span>Distributors</span>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <a class="btn btn-default text-left" style="min-width: 70px; text-align: center; float: right">
                                            <span class="icon-small-12">
                                                <span>Info</span>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                   <%-- <nav>
                        <ul class="pagination">
                            <% if(pagination.totalPages() >= 1) 
                               { 
                                   if(pagination.hasPreviousPage()) 
                                   {%>
                                        <li><a href="Chemist_List.aspx?page=<%=pagination.previousPage() %>" aria-label="Previous">&laquo; Previous</a></li>
                                 <%} 
                                   for(int i=1; i<=pagination.totalPages(); i++) 
                                   {
                                        if(i == page) 
                                        {%>
                                            <li class="active"><span><%=i %></span></li>
                                      <%}
                                        else
                                        {%>
                                            <li><a href="Chemist_List.aspx?page=<%=i %>"><%=i %></a></li>
                                      <%} 
                                   }
                                   if(pagination.hasNextPage())
                                   {%>
                                        <li><a href="Chemist_List.aspx?page=<%=pagination.nextPage() %>" aria-label="Next">Next &raquo;</a></li>
                                 <%} 
                               } %>
                        </ul>
                    </nav>--%>
                    
                        
                    </form>
                </div>
            </div>
            <div class="col-md-2 col-xs-12" style="margin-top:15%;">
                <%--<div class="mainbox">
                    <div class="card">
                        <img class="size1" src="http://media.npr.org/assets/news/2009/10/27/facebook1_sq-17f6f5e06d5742d8c53576f7c13d5cf7158202a9.jpg?s=16" alt="" />
                        <p>D_name</p>
                        <p>D_No.</p>
                        <p>D_Add</p>
                    </div>
                </div>--%>
                <ul class="list-group">
                    <li class="list-group-item">
                         <div class="">
                            <p>D_name</p>
                            <p>D_No.</p>
                            <p>D_Add</p>
                         </div>
                     </li>
                     <li class="list-group-item">
                         <div class="">
                             <p>D_name</p>
                             <p>D_No.</p>
                             <p>D_Add</p>
                         </div>
                     </li>
                </ul>
            </div>
    </div>
    <h1><%=Request.QueryString["name"] %></h1>
    <script src="js/classie.js"></script>
    <script src="js/gnmenu.js"></script>
    <script>
        new gnMenu(document.getElementById('gn-menu'));
    </script>
</body>
</html>

