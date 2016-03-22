<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_Med.aspx.cs" Inherits="WebApplication2.Search_Med" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head id="Head1" runat="server">
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
		<link rel="stylesheet" type="text/css" href="css/component.css" />
        <link href="css/ionicons.min.css" rel="stylesheet">
        <%--<link href="css/style.css" rel="stylesheet">--%>
		<script src="js/modernizr.custom.js"></script>
	</head>
	<body style="background-color:white; margin:0px;">
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
                                    <%--<ul class="gn-submenu">
                                        <li><a class="gn-icon gn-icon-illustrator">Vector Illustrations</a></li>
                                        <li><a class="gn-icon gn-icon-photoshop">Photoshop files</a></li>
                                    </ul>--%>
                                </li>
                                <li><a class="gn-icon gn-icon-cog">Settings</a></li>
                                <li><a class="gn-icon gn-icon-help">Help</a></li>
                                <li>
                                    <a class="gn-icon gn-icon-archive">Archives</a>
                                    <%--<ul class="gn-submenu">
                                        <li><a class="gn-icon gn-icon-article">Articles</a></li>
                                        <li><a class="gn-icon gn-icon-pictures">Images</a></li>
                                        <li><a class="gn-icon gn-icon-videos">Videos</a></li>
                                    </ul>--%>
                                </li>
                            </ul>
                        </div><!-- /gn-scroller -->
                    </nav>
                </li>
                <li><a href="Default.aspx">SEARCH CHEMIST</a></li>
                <li><a href="Search_Med.aspx"><span>SEARCH MEDICINE</span></a></li>
                <li class="download_app"><a href="#download"><span>Download Our App</span></a></li>
            </ul>
            <%-- jumbo box search header --%>
            <div id="h">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 centered">
                        <h1>PHAMAERO<br />Your Medical Proctor.</h1>
                        <div class="mtb">
                            <form id="form1" runat="server">
                                <%--<div class="col-md-8 col-md-offset-2 ">                     
                                    <asp:RadioButton ID="RadioButton1" CssClass="radio-button-style" GroupName="list" runat="server" ToolTip="SEARCH MEDICINE" Text="Medicine" Checked="True"  AutoPostBack="True" />
                                    <asp:RadioButton ID="RadioButton2" CssClass="radio-button-style" GroupName="list" ToolTip="SEARCH MEDICINE" Text="CHEMIST" runat="server" AutoPostBack="True" />
                                </div>--%>
                                     <div class="col-md-10 col-md-offset-2 ">
                                     <%--<asp:TextBox ID="placeholderTextBox" CssClass="subscribe-input" placeholder="Type here....." runat="server"></asp:TextBox>--%>
                                     <%--<input type="email" name="email" class="subscribe-input" placeholder="Enter your e-mail address..." required>--%>
                                         <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                                     <asp:TextBox  CssClass="subscribe-input" ID="txt_Search_Med" placeholder="Search_Med" runat="server"></asp:TextBox>
                                      <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" 
                                          runat="server" 
                                          BehaviorID="AutoCompleteEx"
                                          CompletionSetCount="20"
                                          CompletionInterval="0"
                                          CompletionListItemCssClass="autocomplete_listItem" 
                                          CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                          EnableCaching="true" 
                                          MinimumPrefixLength="1" 
                                          ServiceMethod="GetMed" 
                                          TargetControlID="txt_Search_Med" 
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
                                     <asp:Button ID="Btn_Search_Med"  Text="Search" class='btn btn-conf btn-green' runat="server" />
                                     </div>
                            </form>
                        </div><!--/mtb-->
                    </div>
                </div><!--/row-->
            </div><!--/h-->
        </div><!-- /container-fluid -->

        <div class="container ptb" id="download">
      <div class="row">
        <div class="col-md-6">
          <h2>All the features you want in this kind of apps you'll got it here.</h2>
          <p class="mt">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
          <p class="store">
            <%--<a href="#"><img src="img/app-store.png" height="50" alt=""></a>--%>
            <a href="#"><img src="img/google-play.png" height="50" alt=""></a>
          </p>
        </div>
        <div class="col-md-6">
          <img src="img/phone.png" class="img-responsive mt" alt="">
        </div>
      </div><!--/row-->
    </div><!--/container-->
        <div id="sep">
      <div class="container">
        <div class="row centered">
          <div class="col-md-8 col-md-offset-2">
            <h1>Subscribe to our entertainig health related blogs and start a healthy and refreshing life from now itself.Let us help you.</h1>
            <p><button class="btn btn-conf-2 btn-green">Learn More</button></p>
          </div><!--/col-md-8-->
        </div>
      </div>
    </div><!--/sep-->
      
    <div class="container ptb">
      <div class="row centered">
        <h2 class="mb">Our Services<br/>It's Quite Easy To Understand.</h2>
        <div class="col-md-4">
          <div class="price-table">
              <div class="p-head">
                COMPANY
              </div>
              <div class="p-body">
                <ul class="features">
                  <li>Market Your Product</li>
                  <li>Cost Efficient</li>
                  <li>Multiply Your Reach</li>
                  <li>Easy Approach</li>
                </ul>
                <div class="price">
                  <span class="sub">$</span>
                  <span class="detail">00</span>
                  <span class="sub">/mo.</span>
                </div><!--/price-->
                <button class="btn btn-conf-2 btn-green">Download Now</button>
              </div><!--/p-body-->
          </div><!--/price-table-->
        </div><!--/col-md-4-->

         <div class="col-md-4">
          <div class="price-table">
              <div class="p-head">
                USER
              </div>
              <div class="p-body">
                <ul class="features">
                  <li>Discover Chemist Near You</li>
                  <li>Know Your Medicine</li>
                  <li>Free Support</li>
                  <li>Interesting Health Blogs</li>
                </ul>
                <div class="price">
                  <span class="sub">$</span>
                  <span class="detail">00</span>
                  <span class="sub">/mo.</span>
                </div><!--/price-->
                <button class="btn btn-conf-2 btn-green">Download Now</button>
              </div><!--/p-body-->
          </div><!--/price-table-->
        </div><!--/col-md-4-->

         <div class="col-md-4">
          <div class="price-table">
              <div class="p-head">
                CHEMIST
              </div>
              <div class="p-body">
                <ul class="features">
                  <li>Newly Launched Medicines</li>
                  <li>Free Support</li>
                  <li>Search Alternatives</li>
                  <li>10,000 Users</li>
                </ul>
                <div class="price">
                  <span class="sub">$</span>
                  <span class="detail">00</span>
                  <span class="sub">/mo.</span>
                </div><!--/price-->
                <button class="btn btn-conf-2 btn-green">Download Now</button>
              </div><!--/p-body-->
          </div><!--/price-table-->
        </div><!--/col-md-4-->
      </div><!--/row-->
    </div><!--/container-->

     <%--CSS3 Testimonials Slider--%>
    <div id="green">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-md-offset-3 centered">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Wrapper for slides -->
              <div class="carousel-inner">
                <div class="item active">
                  <h3>I enjoyed so much the last edition of Landing Sumo, that I bought the tickets for the new one edition of the event the first day.</h3>
                  <h5><tgr>DAVID JHONSON</tgr></h5>
                </div>
                <div class="item">
                  <h3>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</h3>
                  <h5><tgr>MARK LAWRENCE</tgr></h5>
                </div>
                <div class="item">
                  <h3>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration, by injected humour.</h3>
                  <h5><tgr>LISA SMITH</tgr></h5>
                </div>
              </div>
            </div><!--/Carousel-->

          </div>
        </div><!--/row-->
      </div><!--/container-->
    </div><!--/green-->
        <%-- Testimonial slider ends --%>
    <div id="f">
      <div class="container">
        <div class="row centered">
          <h2>You Can Contact Us</h2>
          <h5>phamaero@gmail.com</h5>
            <p class="mt">
            <a href="#"><i class="ion-social-twitter"></i></a>
            <a href="#"><i class="ion-social-dribbble"></i></a>
            <a href="#"><i class="ion-social-instagram"></i></a>
            <a href="#"><i class="ion-social-facebook"></i></a>
            <a href="#"><i class="ion-social-pinterest"></i></a>
            <a href="#"><i class="ion-social-tumblr"></i></a>
          </p>
          <h6 class="mt">COPYRIGHT 2015 - PHAMAERO</h6>
        </div><!--/row-->
      </div><!--/container-->
    </div><!--/F-->
        <script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/retina-1.1.0.js"></script>
		<script>
		    new gnMenu(document.getElementById('gn-menu'));
		</script>
        
	</body>
</html>