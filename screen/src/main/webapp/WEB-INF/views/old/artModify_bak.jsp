<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 수정하기</title>
</head>
<body>
	<div class="x_panel">
		<div class="x_title">
			<h2>
				작품 수정하기
			</h2>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br>
			<form class="form-horizontal form-label-left">
				<div class="form-group row ">
					<label class="control-label col-md-3 col-sm-3 ">
						작품명
					</label>
					<div class="col-md-9 col-sm-9 ">
						<input id="name" type="text" class="form-control">
					</div>
				</div>
				<div class="form-group row ">
					<label class="control-label col-md-3 col-sm-3 ">
						작가명
					</label>
					<div class="col-md-9 col-sm-9 ">
						<input id="author" type="text" class="form-control">
					</div>
				</div>
				<!-- <div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						Disabled Input 
					</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" class="form-control" disabled="disabled" placeholder="Disabled Input">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						Read-Only Input
					</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" class="form-control" readonly="readonly" placeholder="Read-Only Input">
					</div>
				</div> -->
				<div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						작품설명 
						<!-- <span class="required">*</span> -->
					</label>
					<div class="col-md-9 col-sm-9 ">
						<textarea id="detail" class="form-control" rows="3"></textarea>
					</div>
				</div>
				<!-- <div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">Password</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="password" class="form-control" value="passwordonetwo">
					</div>
				</div> -->
				<!-- <div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">AutoComplete</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" name="country" id="autocomplete-custom-append" class="form-control col-md-10" autocomplete="off">
					</div>
				</div> -->
				<div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						연재처
					</label>
					<div class="col-md-9 col-sm-9 ">
						<select class="form-control">
							<option>Choose option</option>
							<option>Option one</option>
							<option>Option two</option>
							<option>Option three</option>
							<option>Option four</option>
						</select>
					</div>
				</div>
				<!-- <div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						Select Custom
					</label>
					<div class="col-md-9 col-sm-9 ">
						<select class="select2_single form-control" tabindex="-1">
							<option></option>
							<option value="AK">Alaska</option>
							<option value="HI">Hawaii</option>
							<option value="CA">California</option>
							<option value="NV">Nevada</option>
							<option value="OR">Oregon</option>
							<option value="WA">Washington</option>
							<option value="AZ">Arizona</option>
							<option value="CO">Colorado</option>
							<option value="ID">Idaho</option>
							<option value="MT">Montana</option>
							<option value="NE">Nebraska</option>
							<option value="NM">New Mexico</option>
							<option value="ND">North Dakota</option>
							<option value="UT">Utah</option>
							<option value="WY">Wyoming</option>
							<option value="AR">Arkansas</option>
							<option value="IL">Illinois</option>
							<option value="IA">Iowa</option>
							<option value="KS">Kansas</option>
							<option value="KY">Kentucky</option>
							<option value="LA">Louisiana</option>
							<option value="MN">Minnesota</option>
							<option value="MS">Mississippi</option>
							<option value="MO">Missouri</option>
							<option value="OK">Oklahoma</option>
							<option value="SD">South Dakota</option>
							<option value="TX">Texas</option>
						</select>
					</div>
				</div> -->
				<!-- <div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						Select Grouped
					</label>
					<div class="col-md-9 col-sm-9 ">
						<select class="select2_group form-control">
							<optgroup label="Alaskan/Hawaiian Time Zone">
								<option value="AK">Alaska</option>
								<option value="HI">Hawaii</option>
							</optgroup>
							<optgroup label="Pacific Time Zone">
								<option value="CA">California</option>
								<option value="NV">Nevada</option>
								<option value="OR">Oregon</option>
								<option value="WA">Washington</option>
							</optgroup>
							<optgroup label="Mountain Time Zone">
								<option value="AZ">Arizona</option>
								<option value="CO">Colorado</option>
								<option value="ID">Idaho</option>
								<option value="MT">Montana</option>
								<option value="NE">Nebraska</option>
								<option value="NM">New Mexico</option>
								<option value="ND">North Dakota</option>
								<option value="UT">Utah</option>
								<option value="WY">Wyoming</option>
							</optgroup>
							<optgroup label="Central Time Zone">
								<option value="AL">Alabama</option>
								<option value="AR">Arkansas</option>
								<option value="IL">Illinois</option>
								<option value="IA">Iowa</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="MN">Minnesota</option>
								<option value="MS">Mississippi</option>
								<option value="MO">Missouri</option>
								<option value="OK">Oklahoma</option>
								<option value="SD">South Dakota</option>
								<option value="TX">Texas</option>
								<option value="TN">Tennessee</option>
								<option value="WI">Wisconsin</option>
							</optgroup>
							<optgroup label="Eastern Time Zone">
								<option value="CT">Connecticut</option>
								<option value="DE">Delaware</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="IN">Indiana</option>
								<option value="ME">Maine</option>
								<option value="MD">Maryland</option>
								<option value="MA">Massachusetts</option>
								<option value="MI">Michigan</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NY">New York</option>
								<option value="NC">North Carolina</option>
								<option value="OH">Ohio</option>
								<option value="PA">Pennsylvania</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="VT">Vermont</option>
								<option value="VA">Virginia</option>
								<option value="WV">West Virginia</option>
							</optgroup>
						</select>
					</div>
				</div> -->
				<!-- <div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						Select Multiple
					</label>
					<div class="col-md-9 col-sm-9 ">
						<select class="select2_multiple form-control" multiple="multiple">
							<option>Choose option</option>
							<option>Option one</option>
							<option>Option two</option>
							<option>Option three</option>
							<option>Option four</option>
							<option>Option five</option>
							<option>Option six</option>
						</select>
					</div>
				</div> -->
				<div class="control-group row">
					<label class="control-label col-md-3 col-sm-3 ">작품 태그 관리</label>
					<div class="col-md-9 col-sm-9 ">
						<input id="tags_1" type="text" class="tags form-control" value="social, adverts, sales" data-tagsinput-init="true" style="display: none;">
						<div id="tags_1_tagsinput" class="tagsinput" style="width: auto; min-height: 100px; height: 100px;">
							<span class="tag">
								<span>social&nbsp;&nbsp;</span>
								<a href="#" title="Removing tag">x</a>
							</span>
							<span class="tag">
								<span>adverts&nbsp;&nbsp;</span>
									<a href="#" title="Removing tag">x</a>
								</span>
								<span class="tag">
									<span>sales&nbsp;&nbsp;</span>
									<a href="#" title="Removing tag">x</a>
								</span>
							<div id="tags_1_addTag">
								<input id="tags_1_tag" value="" placeholder="add a tag" style="color: rgb(102, 102, 102); width: 72px;">
							</div>
							<div class="tags_clear"></div>
						</div>
						<div id="suggestions-container" style="position: relative; float: left; width: 250px; margin: 10px;"></div>
					</div>
				</div>
				<!-- <div class="form-group row">
					<label class="col-md-3 col-sm-3  control-label">
						Checkboxes and radios <br> 
						<small class="text-navy">
							Normal Bootstrap elements
						</small>
					</label>
					<div class="col-md-9 col-sm-9 ">
						<div class="checkbox">
							<label>
								<input type="checkbox" value=""> 
								Option one. select more than one options
							</label>
						</div>
						<div class="checkbox">
							<label> 
								<input type="checkbox" value=""> 
								Option two. select more than one options
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios"> 
								Option one. only select one option
							</label>
						</div>
						<div class="radio">
							<label> 
								<input type="radio" value="option2" id="optionsRadios2" name="optionsRadios"> 
								Option two. only select one option
							</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-md-3 col-sm-3  control-label">
						Checkboxes and radios 
						<br> 
						<small class="text-navy">Normal Bootstrap elements</small>
					</label>
					<div class="col-md-9 col-sm-9 ">
						<div class="checkbox">
							<label>
								<div class="icheckbox_flat-green checked" style="position: relative;">
									<input type="checkbox" class="flat" checked="checked" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Checked
							</label>
						</div>
						<div class="checkbox">
							<label>
								<div class="icheckbox_flat-green" style="position: relative;">
									<input type="checkbox" class="flat" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Unchecked
							</label>
						</div>
						<div class="checkbox">
							<label>
								<div class="icheckbox_flat-green disabled" style="position: relative;">
									<input type="checkbox" class="flat" disabled="disabled" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Disabled
							</label>
						</div>
						<div class="checkbox">
							<label>
								<div class="icheckbox_flat-green checked disabled" style="position: relative;">
									<input type="checkbox" class="flat" disabled="disabled" checked="checked" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Disabled &amp; checked
							</label>
						</div>
						<div class="radio">
							<label>
								<div class="iradio_flat-green checked" style="position: relative;">
									<input type="radio" class="flat" checked="" name="iCheck" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Checked
							</label>
						</div>
						<div class="radio">
							<label>
								<div class="iradio_flat-green" style="position: relative;">
									<input type="radio" class="flat" name="iCheck" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Unchecked
							</label>
						</div>
						<div class="radio">
							<label>
								<div class="iradio_flat-green disabled" style="position: relative;">
									<input type="radio" class="flat" name="iCheck" disabled="disabled" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Disabled
							</label>
						</div>
						<div class="radio">
							<label>
								<div class="iradio_flat-green checked disabled" style="position: relative;">
									<input type="radio" class="flat" name="iCheck3" disabled="disabled" checked="" style="position: absolute; opacity: 0;">
									<ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>
								</div> 
								Disabled &amp; Checked
							</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">Switch</label>
					<div class="col-md-9 col-sm-9 ">
						<div class="">
							<label> 
								<input type="checkbox" class="js-switch" checked="" data-switchery="true" style="display: none;">
								<span class="switchery switchery-default" style="background-color: rgb(38, 185, 154); border-color: rgb(38, 185, 154); box-shadow: rgb(38, 185, 154) 0px 0px 0px 11px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;">
									<small style="left: 12px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small>
								</span>
								Checked
							</label>
						</div>
						<div class="">
							<label> 
								<input type="checkbox" class="js-switch" data-switchery="true" style="display: none;">
								<span class="switchery switchery-default" style="box-shadow: rgb(223, 223, 223) 0px 0px 0px 0px inset; border-color: rgb(223, 223, 223); background-color: rgb(255, 255, 255); transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s;">
									<small style="left: 0px; transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small>
								</span>
								Unchecked
							</label>
						</div>
						<div class="">
							<label> 
								<input type="checkbox" class="js-switch" disabled="disabled" data-switchery="true" readonly="" style="display: none;">
								<span class="switchery switchery-default" style="box-shadow: rgb(223, 223, 223) 0px 0px 0px 0px inset; border-color: rgb(223, 223, 223); background-color: rgb(255, 255, 255); transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s; opacity: 0.5;">
									<small style="left: 0px; transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small>
								</span>
								Disabled
							</label>
						</div>
						<div class="">
							<label> 
								<input type="checkbox" class="js-switch" disabled="disabled" checked="checked" data-switchery="true" readonly="" style="display: none;">
								<span class="switchery switchery-default" style="background-color: rgb(38, 185, 154); border-color: rgb(38, 185, 154); box-shadow: rgb(38, 185, 154) 0px 0px 0px 11px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s; opacity: 0.5;">
									<small style="left: 12px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small>
								</span>
								Disabled Checked
							</label>
						</div>
					</div>
				</div> -->
				<div class="ln_solid"></div>
				<div class="form-group">
					<div class="col-md-9 col-sm-9  offset-md-3">
						<button type="button" class="btn btn-primary">Cancel</button>
						<button type="reset" class="btn btn-primary">Reset</button>
						<button type="submit" class="btn btn-success">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>