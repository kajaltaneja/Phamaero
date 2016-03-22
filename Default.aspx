<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Default" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head runat="server">
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
    <%-- navigation bar starts --%>
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
                                </li>
                            </ul>
                        </div><!-- /gn-scroller -->
                    </nav>
                </li>
                <li><a href="Default.aspx">SEARCH CHEMIST</a></li>
                <li><a href="Search_Med.aspx"><span>SEARCH MEDICINE</span></a></li>
                <li class="download_app"><a href="#download"><span>Download Our App</span></a></li>
            </ul>
            <%-- Navigation bar ends --%>
            <%-- jumbo box search header --%>
            <div id="h">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 centered">
                        <h1>PHAMAERO<br />Your Medical Proctor.</h1>
                        <div class="mtb">
                            <form id="form1" runat="server">
                                     <div class="col-md-10 col-md-offset-2 ">
                                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                     <asp:TextBox  CssClass="subscribe-input" ID="placeholderTextBox" placeholder="Enter your location/Pin" runat="server" AutoPostBack="True"></asp:TextBox><!--Textbox for entering location-->
                                      <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" 
                                          runat="server" 
                                          BehaviorID="AutoCompleteEx"
                                          CompletionSetCount="20"
                                          CompletionInterval="0"
                                          CompletionListItemCssClass="autocomplete_listItem" 
                                          CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                          EnableCaching="true" 
                                          MinimumPrefixLength="1" 
                                          ServiceMethod="GetArea" 
                                          TargetControlID="placeholderTextBox" 
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
                                          <%--end of Animation on autocomplete extender --%>
                                      </ajaxToolkit:AutoCompleteExtender>
                                     <asp:Button ID="Button1"  Text="Search" class='btn btn-conf btn-green' runat="server" />
                                     </div>
                            </form>
                        </div><!--/mtb-->
                    </div>
                </div><!--/row-->
            </div><!--/ jumbo box header ends-->
        </div><!-- /container-fluid -->

        <div class="container ptb" id="download">
      <div class="row">
        <div class="col-md-6">
          <h2>All the features you want in this kind of apps you'll got it here.</h2>
          <p class="mt">Phamaero is a medicine and chemist discovery app through which you can discover the chemist nearby you and know your medicines.For pharmacists you can search newly launched medicines on a single click and any information related to that medicine.And wait a minute we are not done:) you can read our very exciting health related blogs. All of this in single app.</p>
          <p class="store">
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
                  <h3>Eagerly waiting for this app to launch.</h3>
                  <h5><tgr>ROHIT GUPTA</tgr></h5>
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