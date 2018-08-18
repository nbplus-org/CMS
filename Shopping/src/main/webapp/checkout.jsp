<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
    <head>
		<!-- Basic page needs
        ============================================ --> 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Checkout | Hope</title>
        <meta name="description" content="">
		<!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,600italic,300italic,700' rel='stylesheet' type='text/css'>
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
		<!-- font awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<!-- carousel CSS  -->
		<link rel="stylesheet" href="css/owl.carousel.css">
		<!-- carousel Theme CSS  -->
		<link rel="stylesheet" href="css/owl.my_theme.css">
		<!-- carousel transitions CSS  -->
		<link rel="stylesheet" href="css/owl.transitions.css">
		<!-- nivo slider slider css -->
        <link rel="stylesheet" href="css/nivo-slider.css">
		<!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
		<!-- Price jquery-ui  -->
        <link rel="stylesheet" href="css/jquery-ui.css">
		<!-- fancy-box theme -->
        <link rel="stylesheet" href="fancy-box/jquery.fancybox.css">
		<!-- normalizer  -->
        <link rel="stylesheet" href="css/normalize.css">
		<!-- bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Mobile menu css -->
        <link rel="stylesheet" href="css/meanmenu.min.css">
		<!-- main  -->
        <link rel="stylesheet" href="css/main.css">
		<!-- style  -->
        <link rel="stylesheet" href="style.css">
		<!-- Responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
		<!-- modernizr JS -->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
		<!--Start Header Top area -->
        
        
        <%@include file="header.jsp" %>
		<!--End Mobile Menu area -->
		<!--End Main Menu area -->
		
		
		
		<div class="checkout_accrodion_area">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
						<div class="accordion" id="accordion2">
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingOne">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									 <span>1</span>Checkout Method
								  </a>
								</div>
								<div id="collapseOne" class="panel-collapse collapse in" aria-labelledby="headingOne">
								  <div class="accordion-inner">
									<div class="row">
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<div class="guest_register">
												<h2>CHECKOUT AS A GUEST OR REGISTER</h2>
												<h3>Register with us for future convenience:</h3>
												<div class="radio_button">
													<input type="radio" name="ratings[1]" id="Quality_1" value="1" class="radio">
													<h4>Checkout as Guest</h4>
												</div>
												<div class="radio_button">
													<input type="radio" name="ratings[1]" id="Quality_2" value="1" class="radio">
													<h4>Register</h4>
												</div>
												<h5>Register and save time!</h5>
												<h6>Register with us for future convenience:</h6>
												<ul id="order_history">
													<li>Fast and easy check out</li>
													<li>Easy access to your order history and status</li>
												</ul>
												<div class="Continue_button">
													<button type="submit" title="Submit Review" class="button">Continue</button>
												</div>
											</div>
										</div>
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
											<div class="login_area">
												<h2>LOGIN</h2>
												<h3>Already registered?</h3>
												<h4>Please log in below:</h4>
												<ul id="login_panel">
													<li>Email Address<span>*</span></li>
													<li><input type="text" class="input-text required-entry validate-email" name="login[username]" value=""></li>
													<li>Password<span>*</span></li>
													<li><input type="text" class="input-text required-entry validate-email" name="login[username]" value=""></li>
												</ul>
												<div class="Continue_button continue_top">
													<h2><a href="#">Forgot your password?</a></h2>
													<button type="submit" title="Submit Review" class="button">Login</button>
												</div>
											</div>
										</div>
									</div>
								  </div>
								</div>
							</div>
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingTwo">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
									<span>2</span>Billing Information
								  </a>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse" aria-labelledby="headingTwo">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="billing_info">
													<ul class="billing_in">
														<li>First Name<span>*</span></li>
														<li>
														<input type="text" id="billing:firstname" name="billing[firstname]" value="" title="First Name" maxlength="255" class="input-text required-entry"></li>
														<li>Middle Name/Initial</li>
														<li><input type="text" id="billing:middlename" name="billing[middlename]" value="" title="Middle Name/Initial" class="input-text "></li>
														<li>Last Name<span>*</span></li>
														<li><input type="text" id="billing:lastname" name="billing[lastname]" value="" title="Last Name" maxlength="255" class="input-text required-entry"></li>
														<li>Company</li>
														<li><input type="text" id="billing:company" name="billing[company]" value="" title="Company" class="input-text "></li>
														<li>Email Address<span>*</span></li>
														<li><input type="text" name="billing[email]" id="billing:email" value="" title="Email Address" class="input-text validate-email required-entry"></li>
														<li>Address<span>*</span></li>
														<li><input type="text" title="Street Address 2" name="billing[street][]" id="billing:street2" value="" class="input-text "></li>
														<li><input type="text" title="Street Address" name="billing[street][]" id="billing:street1" value="" class="input-text  required-entry"></li>
														<li>City<span>*</span></li>
														<li><input type="text" title="City" name="billing[city]" value="" class="input-text  required-entry" id="billing:city"></li>
														<li>State/Province<span>*</span></li>
														<li>
															<select id="billing:region_id" name="billing[region_id]" title="State/Province" class="validate-select required-entry">
															<option value="">Please select region, state or province</option>
															<option value="1">Alabama</option><option value="2">Alaska</option>
															<option value="3">American Samoa</option>
															<option value="4">Arizona</option>
															<option value="5">Arkansas</option>
															<option value="6">Armed Forces Africa</option>
															<option value="7">Armed Forces Americas</option>
															<option value="8">Armed Forces Canada</option>
															<option value="9">Armed Forces Europe</option>
															<option value="10">Armed Forces Middle East</option>
															<option value="11">Armed Forces Pacific</option>
															<option value="12">California</option>
															<option value="13">Colorado</option>
															<option value="14">Connecticut</option>
															<option value="15">Delaware</option>
															<option value="16">District of Columbia</option>
															<option value="17">Federated States Of Micronesia</option>
															<option value="18">Florida</option>
															<option value="19">Georgia</option>
															<option value="20">Guam</option>
															<option value="21">Hawaii</option>
															<option value="22">Idaho</option>
															<option value="23">Illinois</option>
															<option value="24">Indiana</option>
															<option value="25">Iowa</option>
															<option value="26">Kansas</option>
															<option value="27">Kentucky</option>
															<option value="28">Louisiana</option>
															<option value="29">Maine</option>
															<option value="30">Marshall Islands</option>
															<option value="31">Maryland</option>
															<option value="32">Massachusetts</option>
															<option value="33">Michigan</option>
															<option value="34">Minnesota</option>
															<option value="35">Mississippi</option>
															<option value="36">Missouri</option>
															<option value="37">Montana</option>
															<option value="38">Nebraska</option>
															<option value="39">Nevada</option>
															<option value="40">New Hampshire</option>
															<option value="41">New Jersey</option>
															<option value="42">New Mexico</option>
															<option value="43">New York</option>
															<option value="44">North Carolina</option>
															<option value="45">North Dakota</option>
															<option value="46">Northern Mariana Islands</option>
															<option value="47">Ohio</option>
															<option value="48">Oklahoma</option>
															<option value="49">Oregon</option>
															<option value="50">Palau</option>
															<option value="51">Pennsylvania</option>
															<option value="52">Puerto Rico</option>
															<option value="53">Rhode Island</option>
															<option value="54">South Carolina</option>
															<option value="55">South Dakota</option>
															<option value="56">Tennessee</option>
															<option value="57">Texas</option>
															<option value="58">Utah</option>
															<option value="59">Vermont</option>
															<option value="60">Virgin Islands</option>
															<option value="61">Virginia</option>
															<option value="62">Washington</option>
															<option value="63">West Virginia</option>
															<option value="64">Wisconsin</option>
															<option value="65">Wyoming</option>
															</select>
														</li>
														<li>Zip/Postal Code<span>*</span></li>
														<li><input type="text" title="Zip/Postal Code" name="billing[postcode]" id="billing:postcode" value="" class="input-text validate-zip-international  required-entry"></li>
														<li>Country<span>*</span></li>
														<li>
															<select name="billing[country_id]" id="billing:country_id" class="validate-select" title="Country">
															<option value="AF">Afghanistan</option>
															<option value="AX">Åland Islands</option>
															<option value="AL">Albania</option>
															<option value="DZ">Algeria</option>
															<option value="AS">American Samoa</option>
															<option value="AD">Andorra</option>
															<option value="AO">Angola</option>
															<option value="AI">Anguilla</option>
															<option value="AQ">Antarctica</option>
															<option value="AG">Antigua and Barbuda</option>
															<option value="AR">Argentina</option>
															<option value="AM">Armenia</option>
															<option value="AW">Aruba</option>
															<option value="AU">Australia</option>
															<option value="AT">Austria</option>
															<option value="AZ">Azerbaijan</option>
															<option value="BS">Bahamas</option>
															<option value="BH">Bahrain</option>
															<option value="BD">Bangladesh</option>
															<option value="BB">Barbados</option>
															<option value="BY">Belarus</option>
															<option value="BE">Belgium</option>
															<option value="BZ">Belize</option>
															<option value="BJ">Benin</option>
															<option value="BM">Bermuda</option>
															<option value="BT">Bhutan</option>
															<option value="BO">Bolivia</option>
															<option value="BA">Bosnia and Herzegovina</option>
															<option value="BW">Botswana</option>
															<option value="BV">Bouvet Island</option>
															<option value="BR">Brazil</option>
															<option value="IO">British Indian Ocean Territory</option>
															<option value="VG">British Virgin Islands</option>
															<option value="BN">Brunei</option>
															<option value="BG">Bulgaria</option>
															<option value="BF">Burkina Faso</option>
															<option value="BI">Burundi</option>
															<option value="KH">Cambodia</option>
															<option value="CM">Cameroon</option>
															<option value="CA">Canada</option>
															<option value="CV">Cape Verde</option>
															<option value="KY">Cayman Islands</option>
															<option value="CF">Central African Republic</option>
															<option value="TD">Chad</option>
															<option value="CL">Chile</option>
															<option value="CN">China</option>
															<option value="CX">Christmas Island</option>
															<option value="CC">Cocos (Keeling) Islands</option>
															<option value="CO">Colombia</option>
															<option value="KM">Comoros</option>
															<option value="CG">Congo - Brazzaville</option>
															<option value="CD">Congo - Kinshasa</option>
															<option value="CK">Cook Islands</option>
															<option value="CR">Costa Rica</option>
															<option value="CI">Côte d’Ivoire</option>
															<option value="HR">Croatia</option>
															<option value="CU">Cuba</option>
															<option value="CY">Cyprus</option>
															<option value="CZ">Czech Republic</option>
															<option value="DK">Denmark</option>
															<option value="DJ">Djibouti</option>
															<option value="DM">Dominica</option>
															<option value="DO">Dominican Republic</option>
															<option value="EC">Ecuador</option>
															<option value="EG">Egypt</option>
															<option value="SV">El Salvador</option>
															<option value="GQ">Equatorial Guinea</option>
															<option value="ER">Eritrea</option>
															<option value="EE">Estonia</option>
															<option value="ET">Ethiopia</option>
															<option value="FK">Falkland Islands</option>
															<option value="FO">Faroe Islands</option>
															<option value="FJ">Fiji</option>
															<option value="FI">Finland</option>
															<option value="FR">France</option>
															<option value="GF">French Guiana</option>
															<option value="PF">French Polynesia</option>
															<option value="TF">French Southern Territories</option>
															<option value="GA">Gabon</option>
															<option value="GM">Gambia</option>
															<option value="GE">Georgia</option>
															<option value="DE">Germany</option>
															<option value="GH">Ghana</option>
															<option value="GI">Gibraltar</option>
															<option value="GR">Greece</option>
															<option value="GL">Greenland</option>
															<option value="GD">Grenada</option>
															<option value="GP">Guadeloupe</option>
															<option value="GU">Guam</option>
															<option value="GT">Guatemala</option>
															<option value="GG">Guernsey</option>
															<option value="GN">Guinea</option>
															<option value="GW">Guinea-Bissau</option>
															<option value="GY">Guyana</option>
															<option value="HT">Haiti</option>
															<option value="HM">Heard &amp; McDonald Islands</option>
															<option value="HN">Honduras</option>
															<option value="HK">Hong Kong SAR China</option>
															<option value="HU">Hungary</option>
															<option value="IS">Iceland</option>
															<option value="IN">India</option>
															<option value="ID">Indonesia</option>
															<option value="IR">Iran</option>
															<option value="IQ">Iraq</option>
															<option value="IE">Ireland</option>
															<option value="IM">Isle of Man</option>
															<option value="IL">Israel</option>
															<option value="IT">Italy</option>
															<option value="JM">Jamaica</option>
															<option value="JP">Japan</option>
															<option value="JE">Jersey</option>
															<option value="JO">Jordan</option>
															<option value="KZ">Kazakhstan</option>
															<option value="KE">Kenya</option>
															<option value="KI">Kiribati</option>
															<option value="KW">Kuwait</option>
															<option value="KG">Kyrgyzstan</option>
															<option value="LA">Laos</option>
															<option value="LV">Latvia</option>
															<option value="LB">Lebanon</option>
															<option value="LS">Lesotho</option>
															<option value="LR">Liberia</option>
															<option value="LY">Libya</option>
															<option value="LI">Liechtenstein</option>
															<option value="LT">Lithuania</option>
															<option value="LU">Luxembourg</option>
															<option value="MO">Macau SAR China</option>
															<option value="MK">Macedonia</option>
															<option value="MG">Madagascar</option>
															<option value="MW">Malawi</option>
															<option value="MY">Malaysia</option>
															<option value="MV">Maldives</option>
															<option value="ML">Mali</option>
															<option value="MT">Malta</option>
															<option value="MH">Marshall Islands</option>
															<option value="MQ">Martinique</option>
															<option value="MR">Mauritania</option>
															<option value="MU">Mauritius</option>
															<option value="YT">Mayotte</option>
															<option value="MX">Mexico</option>
															<option value="FM">Micronesia</option>
															<option value="MD">Moldova</option>
															<option value="MC">Monaco</option>
															<option value="MN">Mongolia</option>
															<option value="ME">Montenegro</option>
															<option value="MS">Montserrat</option>
															<option value="MA">Morocco</option>
															<option value="MZ">Mozambique</option>
															<option value="MM">Myanmar (Burma)</option>
															<option value="NA">Namibia</option>
															<option value="NR">Nauru</option>
															<option value="NP">Nepal</option>
															<option value="NL">Netherlands</option>
															<option value="AN">Netherlands Antilles</option>
															<option value="NC">New Caledonia</option>
															<option value="NZ">New Zealand</option>
															<option value="NI">Nicaragua</option>
															<option value="NE">Niger</option>
															<option value="NG">Nigeria</option>
															<option value="NU">Niue</option>
															<option value="NF">Norfolk Island</option>
															<option value="MP">Northern Mariana Islands</option>
															<option value="KP">North Korea</option>
															<option value="NO">Norway</option>
															<option value="OM">Oman</option>
															<option value="PK">Pakistan</option>
															<option value="PW">Palau</option>
															<option value="PS">Palestinian Territories</option>
															<option value="PA">Panama</option>
															<option value="PG">Papua New Guinea</option>
															<option value="PY">Paraguay</option>
															<option value="PE">Peru</option>
															<option value="PH">Philippines</option>
															<option value="PN">Pitcairn Islands</option>
															<option value="PL">Poland</option>
															<option value="PT">Portugal</option>
															<option value="PR">Puerto Rico</option>
															<option value="QA">Qatar</option>
															<option value="RE">Réunion</option>
															<option value="RO">Romania</option>
															<option value="RU">Russia</option>
															<option value="RW">Rwanda</option>
															<option value="BL">Saint Barthélemy</option>
															<option value="SH">Saint Helena</option>
															<option value="KN">Saint Kitts and Nevis</option>
															<option value="LC">Saint Lucia</option>
															<option value="MF">Saint Martin</option>
															<option value="PM">Saint Pierre and Miquelon</option>
															<option value="WS">Samoa</option>
															<option value="SM">San Marino</option>
															<option value="ST">São Tomé and Príncipe</option>
															<option value="SA">Saudi Arabia</option>
															<option value="SN">Senegal</option>
															<option value="RS">Serbia</option>
															<option value="SC">Seychelles</option>
															<option value="SL">Sierra Leone</option>
															<option value="SG">Singapore</option>
															<option value="SK">Slovakia</option>
															<option value="SI">Slovenia</option>
															<option value="SB">Solomon Islands</option>
															<option value="SO">Somalia</option>
															<option value="ZA">South Africa</option>
															<option value="GS">South Georgia &amp; South Sandwich Islands</option>
															<option value="KR">South Korea</option>
															<option value="ES">Spain</option>
															<option value="LK">Sri Lanka</option>
															<option value="VC">St. Vincent &amp; Grenadines</option>
															<option value="SD">Sudan</option>
															<option value="SR">Suriname</option>
															<option value="SJ">Svalbard and Jan Mayen</option>
															<option value="SZ">Swaziland</option>
															<option value="SE">Sweden</option>
															<option value="CH">Switzerland</option>
															<option value="SY">Syria</option>
															<option value="TW">Taiwan</option>
															<option value="TJ">Tajikistan</option>
															<option value="TZ">Tanzania</option>
															<option value="TH">Thailand</option>
															<option value="TL">Timor-Leste</option>
															<option value="TG">Togo</option>
															<option value="TK">Tokelau</option>
															<option value="TO">Tonga</option>
															<option value="TT">Trinidad and Tobago</option>
															<option value="TN">Tunisia</option>
															<option value="TR">Turkey</option>
															<option value="TM">Turkmenistan</option>
															<option value="TC">Turks and Caicos Islands</option>
															<option value="TV">Tuvalu</option>
															<option value="UG">Uganda</option>
															<option value="UA">Ukraine</option>
															<option value="AE">United Arab Emirates</option>
															<option value="GB">United Kingdom</option>
															<option value="US" selected="selected">United States</option>
															<option value="UY">Uruguay</option>
															<option value="UM">U.S. Outlying Islands</option>
															<option value="VI">U.S. Virgin Islands</option>
															<option value="UZ">Uzbekistan</option>
															<option value="VU">Vanuatu</option>
															<option value="VA">Vatican City</option>
															<option value="VE">Venezuela</option>
															<option value="VN">Vietnam</option>
															<option value="WF">Wallis and Futuna</option>
															<option value="EH">Western Sahara</option>
															<option value="YE">Yemen</option>
															<option value="ZM">Zambia</option>
															<option value="ZW">Zimbabwe</option>
															</select>
														</li>
														<li>Telephone<span>*</span></li>
														<li><input type="text" name="billing[telephone]" value="" title="Telephone" class="input-text  required-entry" id="billing:telephone"></li>
														<li>Fax</li>
														<li><input type="text" name="billing[fax]" value="" title="Fax" class="input-text " id="billing:fax"></li>
														<li><input type="radio" name="billing[use_for_shipping]" value="1" checked="checked" title="Ship to this address" class="radio">
														<label>Ship to this address</label>
														</li>
														<li><input type="radio" name="billing[use_for_shipping]" value="0" title="Ship to different address" class="radio">
														<label>Ship to different address</label>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="Continue_button">
													<button type="submit" title="Submit Review" class="button">Continue</button>
												</div>
											</div>
										</div>
								  </div>
								</div>
							</div>
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingThree">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<span>3</span>Shipping Method
								  </a>
								</div>
								<div id="collapseThree" class="panel-collapse collapse" aria-labelledby="headingThree">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<div class="flat_rate">
													<h2>Flat Rate</h2>
													<h3>Fixed $5.00</h3>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="Continue_button continue_top continue_another">
													<h2><a href="#"><i class="fa fa-angle-double-left"></i>Back</a></h2>
													<button type="submit" title="Submit Review" class="button">Continue</button>
												</div>
											</div>
										</div>
								  </div>
								</div>
							</div>
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingFour">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
									<span>4</span>Payment Information
								  </a>
								</div>
								<div id="collapseFour" class="panel-collapse collapse" aria-labelledby="headingFour">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
												<ul class="billing_in">
													<li><input type="radio" name="billing[use_for_shipping]" value="1" checked="checked" title="Ship to this address" class="radio">
													<label>Check / Money order</label>
													</li>
													<li><input type="radio" name="billing[use_for_shipping]" value="0" title="Ship to different address" class="radio">
													<label>Credit Card (saved)</label>
													</li>
													<li>Name on Card<span>*</span></li>
													<li><input type="text" title="Name on Card" class="input-text required-entry" id="ccsave_cc_owner" name="payment[cc_owner]" value=""></li>
													<li>Credit Card Type<span>*</span></li>
													<li>
														<select id="ccsave_cc_type" name="payment[cc_type]" title="Credit Card Type" class="required-entry validate-cc-type-select">
														<option value="">--Please Select--</option>
														<option value="AE">American Express</option>
														<option value="VI">Visa</option>
														<option value="MC">MasterCard</option>
														<option value="DI">Discover</option>
													</select>
													</li>
													<li>Expiration Date<span>*</span></li>
													<li>
														<select id="ccsave_expiration" name="payment[cc_exp_month]" class="month validate-cc-exp required-entry">
															<option value="" selected="selected">Month</option>
															<option value="1">01 - January</option>
															<option value="2">02 - February</option>
															<option value="3">03 - March</option>
															<option value="4">04 - April</option>
															<option value="5">05 - May</option>
															<option value="6">06 - June</option>
															<option value="7">07 - July</option>
															<option value="8">08 - August</option>
															<option value="9">09 - September</option>
															<option value="10">10 - October</option>
															<option value="11">11 - November</option>
															<option value="12">12 - December</option>
														</select>
														<select id="ccsave_expiration_yr" name="payment[cc_exp_year]" class="year required-entry">
															<option value="" selected="selected">Year</option>
															<option value="2015">2015</option>
															<option value="2016">2016</option>
															<option value="2017">2017</option>
															<option value="2018">2018</option>
															<option value="2019">2019</option>
															<option value="2020">2020</option>
															<option value="2021">2021</option>
															<option value="2022">2022</option>
															<option value="2023">2023</option>
															<option value="2024">2024</option>
															<option value="2025">2025</option>
														</select>
													</li>
													<li>Card Verification Number<span>*</span></li>
													<li>
														<div class="v-fix">
															<input type="text" title="Card Verification Number" class="input-text cvv required-entry validate-cc-cvn" id="ccsave_cc_cid" name="payment[cc_cid]" value="">
															<a href="#" class="cvv-what-is-this">What is this?</a>
														</div>
													</li>
												</ul>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="Continue_button continue_top continue_another">
													<h2><a href="#"><i class="fa fa-angle-double-left"></i>Back</a></h2>
													<button type="submit" title="Submit Review" class="button">Continue</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel accordion-group">
								<div class="accordion-heading" id="headingFive">
								  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
									<span>5</span>Order Review
								  </a>
								</div>
								<div id="collapseFive" class="panel-collapse collapse" aria-labelledby="headingFive">
								  <div class="accordion-inner">
										<div class="row">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="accordion_total_pricing">
													<table id="product_details_price">
														<tr>
															<th>Product Name</th>
															<th>Price</th>
															<th>Qty</th>
															<th>Subtotal</th>
														</tr>
														<tr>
															<td><h2>Pellentesque hendrerit</h2></td>
															<td>$800.00</td>
															<td>1</td>
															<td>$800.00</td>
														</tr>
														<tr>
															<td><h2>Vivamus eu imper</h2></td>
															<td>$999.00</td>
															<td>1</td>
															<td>$999.00</td>
														</tr>
													</table>
													<table id="product_details_rate">
														<tr>
															<td>Subtotal</td>
															<td>$1,799.00</td>
														</tr>
														<tr>
															<td>Shipping & Handling (Flat Rate - Fixed)</td>
															<td>$10.00</td>
														</tr>
														<tr>
															<th>Grand Total</th>
															<th>$1,809.00</th>
														</tr>
													</table>
												</div>
												<div class="Continue_button continue_top place_order">
													<h2>Forgot an Item? <a href="#">Forgot your password?</a></h2>
													<button type="submit" title="Submit Review" class="button">Place Order</button>
												</div>
											</div>
										</div>
								  </div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
						<div class="check_progress">
							<h2>YOUR CHECKOUT PROGRESS</h2>
							<ul id="progress_btn">
								<li><i class="fa fa-minus"></i>Billing Address</li>
								<li><i class="fa fa-minus"></i>Shipping Address</li>
								<li><i class="fa fa-minus"></i>Shipping Method</li>
								<li><i class="fa fa-minus"></i>Payment Method</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--Start branding area -->
	    <%@ include file="brand.jsp" %>
		<!--End branding area -->
		
		
		<!--Start footer area -->
         
        <%@include file="footer.jsp" %>
         
		<!--End footer area -->
		<!-- jquery JS -->
        <script src="js/vendor/jquery-1.11.3.min.js"></script>
		<!-- bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
		<!-- Mobile menu JS -->
        <script src="js/jquery.meanmenu.js"></script>
		<!-- jquery.easing js -->
        <script src="js/jquery.easing.1.3.min.js"></script>
		<!-- knob circle js -->
        <script src="js/jquery.knob.js"></script>
		<!-- fancybox JS -->
        <script src="fancy-box/jquery.fancybox.pack.js"></script>
		<!-- price slider JS  -->
        <script src="js/price-slider.js"></script>
		<!-- nivo slider JS -->
        <script src="js/jquery.nivo.slider.pack.js"></script>
		<!-- wow JS -->
        <script src="js/wow.js"></script>
		<!-- nivo-plugin JS -->
		<script src="js/nivo-plugin.js"></script>
		<!-- scrollUp JS -->
		<script src="js/jquery.scrollUp.js"></script>
		<!-- carousel JS -->
        <script src="js/owl.carousel.min.js"></script>
		<!-- plugins JS -->
        <script src="js/plugins.js"></script>
		<!-- main JS  -->
        <script src="js/main.js"></script>
    </body>
</html>
