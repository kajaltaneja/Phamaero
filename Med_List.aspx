<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Med_List.aspx.cs" Inherits="WebApplication2.Med_List" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PHAMAERO "Your Medical Proctor"</title>
    <meta name="description" content="Search nearest chemist and medicines available." />
    <meta name="keywords" content="search medicine, nearest chemist, new medicines" />
    <link rel="shortcut icon" href="../favicon.ico" />
    <link rel="stylesheet" type="text/css" href="css/normalize.css" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" /> 
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
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
                                <input placeholder="Search" type="search" class="gn-search" />
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
      <form id="form1" runat="server">
    <div class="container-fluid" style="margin-top:100px;">
        <div class="row">
                <div class="col-md-6 col-xs-12  col-md-offset-3">
                   <div class="col-md-8 col-xs-12 ">
                       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                      <asp:TextBox  CssClass="search-medicine" ID="txt_Search_More_Med" placeholder="Search More Medicine" runat="server"></asp:TextBox>
                       <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" 
                           runat="server" 
                                          BehaviorID="AutoCompleteEx"
                                          CompletionSetCount="20"
                                          CompletionInterval="0"
                                          CompletionListItemCssClass="autocomplete_listItem" 
                                          CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                          EnableCaching="true" 
                                          MinimumPrefixLength="1" 
                                          ServiceMethod="GetMed" 
                                          TargetControlID="txt_Search_More_Med" 
                                          CompletionListCssClass="autocomplete_completionListElement">
                                          <Animations>
            <OnShow>
                <Sequence>
                        
                    <OpacityAction Opacity="0" />
                    <HideAction Visible="true" />
                            
                           
                    <ScriptAction Script="
                        // Cache the size and setup the initial size
                        var behavior = $find('AutoCompleteEx');
                        if (!behavior._height) {
                            var target = behavior.get_completionList();
                            behavior._height = target.offsetHeight - 2;
                            target.style.height = '0px';
                        }" />
                            
                    <%-- Expand from 0px to the appropriate size while fading in --%>
                    <Parallel Duration=".4">
                        <FadeIn />
                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                    </Parallel>
                </Sequence>
            </OnShow>
            <OnHide>
                <%-- Collapse down to 0px and fade out --%>
                <Parallel Duration=".4">
                    <FadeOut />
                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                </Parallel>
            </OnHide>
            </Animations>
                       </ajaxToolkit:AutoCompleteExtender>
                   </div>
                   <div class="col-md-2 col-xs-12">
                      <asp:Button ID="Button1" Text="Search" class='btn btn-conf-1 btn-green' runat="server"  />
                   </div>
                </div>
                <div class="col-md-6 col-xs-12" style="background-color:grey; height:500px; margin:0;">
                    <asp:Label ID="Label1" runat="server" >
                        <h1>Query String</h1>
                         Data is: <%=Session["Data"] %>
                    </asp:Label>
                </div>
                <div class="col-md-6 col-xs-12" style="background-color:green; height:500px; margin:0;"></div>
                   </div>
            </div>
          </form>
        <%--<h1><%=Request.QueryString["name"] %></h1>--%>
       <script src="js/classie.js"></script>
    <script src="js/gnmenu.js"></script>
    <script>
        new gnMenu(document.getElementById('gn-menu'));
    </script>
</body>
</html>
