<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OwnerPage.aspx.cs" Inherits="Website.OwnerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
   


<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />


 <link href="default.css" rel="stylesheet" />
<link href="fonts.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css' />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

    <style type="text/css">
        #mediaBtns {
            height: 49px;
            width: 243px;
            float: right;
			margin-right: 20%;
        }
        </style>

</head>
<body>

  <!--  <%--facebook feed--%>
    <div id="fb-root" >
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

   </div> -->

  

    <form id="form1" runat="server">
    <div id="header" class="container">
	<div id="logo" class="container">
		<h1><a href="HomePage.aspx" class="image-full"><img src="../images/MJSNOWGUY.png" style="width: 422px"  /></a></h1>
        
	</div>
    
        <div id="mediaBtns" class="container">
        <ul class="soc">
	 <li>
        
	     <h1 style="font-size: 50px; font-weight: bold; color: #000000; ">Site Administration</h1>
</li>
</ul>
		
          
            &nbsp;&nbsp;&nbsp;
	</div>
</div>
       
<div id="wrapper">
	<div id="page" class="container">
		<div id="content" class="twitter">

            
         
			<%--<a class="twitter-timeline" href="https://twitter.com/mjsnow15" data-widget-id="593147987339030528">Tweets by @mjsnow15</a>
<script type="text/jscript">!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
          --%>  
            </div>
		
       <script>
           (function ($) {
               $.fn.extend({
                   rotaterator: function (options) {

                       var defaults = {
                           fadeSpeed: 200,
                           pauseSpeed: 100,
                           child: null
                       };

                       var options = $.extend(defaults, options);

                       return this.each(function () {
                           var o = options;
                           var obj = $(this);
                           var items = $(obj.children(), obj);
                           items.each(function () { $(this).hide(); })
                           if (!o.child) {
                               var next = $(obj).children(':first');
                           } else {
                               var next = o.child;
                           }
                           $(next).fadeIn(o.fadeSpeed, function () {
                               $(next).delay(o.pauseSpeed).fadeOut(o.fadeSpeed, function () {
                                   var next = $(this).next();
                                   if (next.length == 0) {
                                       next = $(obj).children(':first');
                                   }
                                   $(obj).rotaterator({ child: next, fadeSpeed: o.fadeSpeed, pauseSpeed: o.pauseSpeed });
                               })
                           });
                       });
                   }
               });
           })(jQuery);

           $(document).ready(function () {
               $('#rotate').rotaterator({ fadeSpeed: 1750, pauseSpeed: 2000 });
           }); $(document).ready(function () {
               $('#rotate2').rotaterator({ fadeSpeed: 1750, pauseSpeed: 2000 });
           });

           function rotateBanners(elem) {
               var active = $(elem + " img.active");
               var next = active.next();
               if (next.length == 0)
                   next = $(elem + " img:first");
               active.removeClass("active").fadeOut(2000);
               next.addClass("active").fadeIn(2000);
           }

           function prepareRotator(elem) {
               $(elem + " img").fadeOut(0);
               $(elem + " img:first").fadeIn(0).addClass("active");
           }

           function startRotator(elem) {
               prepareRotator(elem);
               setInterval("rotateBanners('" + elem + "')", 5000);
           }
       </script>
         <style>

             #rotate2 {
                 
                padding-left:200px;
                font-size:50px;
             }
              #wrapper {
            border-bottom:4px solid red;
           border-top:4px solid red;
        }

             #FooterLinks1 {
                 color:red;
             }
             #rotate img { 
                 float:right;
                position: absolute;
                 top: 32px;
                 left: 588px;
             }

             .container {
                 top:0px;
             }


            #HeaderLinks {
               
                color:red;

            }
            .auto-style5 {
                width: 609px;
                vertical-align: top;
                 height: 236px;
             }
            .auto-style6 {
                width: 3401px;
                height: 236px;
             }
        </style>
		
			<br />
            <u></u>
            <div id ="HeaderLinks">&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<u>HOME/SIGN OUT</u>&nbsp;&nbsp; <u>EVENTS EDITOR</u>&nbsp;&nbsp; <u>GALLERY EDITOR</u>&nbsp;&nbsp; <u>SPONSERS EDITOR</u>&nbsp;&nbsp; <u>CLUBINFO EDITOR</u>&nbsp;&nbsp; <u>CONTACT EDITOR</u>&nbsp;&nbsp; <u>CREATE FACEBOOK MESSAGE </u>&nbsp;&nbsp; <u>CREATE TWITTER MESSAGE</u>&nbsp;&nbsp; <u>VIEW REPORTS</u>&nbsp;&nbsp;
		</div><br />
           
            <br />
             &nbsp;
             <br />
          
               <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
			
			
            <%--<a href="events.aspx" class="button">More Info</a>--%> 
            <br />
       
	
 </div>    
</div>



    <table id="Footer">
        <tr>
            <td valign="top" class="auto-style6">
        <div id="copyright" >
	
    	&copy; MJ Sno-Drifters. All rights reserved. | Like us on <a href="https://www.facebook.com/MooseJawSnoDrifters" style="color: #FF0000">Facebook</a> 
            | Follow us on <a href="https://twitter.com/mjsnow15" style="color: #FF0000" aria-busy="False">Twitter</a> |

     Send Us An <a href="mailto:mjsnowmobileclub@gmail.com" style="color: #FF0000" >  Email</a>.<br /><br /><br />

    <a href="contact.aspx" style="color: #FF0000">Contact Us</a> | <a href="events.aspx" style="color: #FF0000">Events</a> | <a href="gallery.aspx" style="color: #FF0000" >Gallery</a> 
    | <a href="sponsors.aspx" style="color: #FF0000">Sponsors</a> | <a href="clubinfo.aspx" style="color: #FF0000">Club Info</a> | <a href="ownerlogin.aspx" style="color: #FF0000" >Owner Login</a><br /> <br /><br />

</div></td>
       <td class="auto-style5"> <div id="4mediabuttons">
   

    </div>

       </td> </tr>
</table>
    </form>
</body>
</html>