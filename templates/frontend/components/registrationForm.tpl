{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $locale string Locale key to use in the affiliate field
 * @uses $firstName string First name input entry if available
 * @uses $middleName string Middle name input entry if available
 * @uses $lastName string Last name input entry if available
 * @uses $countries array List of country options
 * @uses $country string The selected country if available
 * @uses $email string Email input entry if available
 * @uses $username string Username input entry if available
 *}

		<h5 class="uk-label">{translate key="user.profile"}</h5>

		<div class="first_name uk-margin">
			<label class="uk-form-label">
					{translate key="user.givenName"}
					<span class="required">*</span>
			</label>
			<input class="uk-input" type="text" name="givenName" id="givenName" value="{$givenName|escape}" maxlength="80" required>
		</div>
		<div class="last_name uk-margin">
			<label class="uk-form-label">
					{translate key="user.familyName"}
					<span class="required">*</span>
			</label>
			<input class="uk-input" type="text" name="familyName" id="familyName" value="{$familyName|escape}" maxlength="80" required>
		</div>
		<div class="affiliation uk-margin">
			<label class="uk-form-label">
					{translate key="user.affiliation"}
					<span class="required">*</span>
			</label>
			<input class="uk-input" type="text" name="affiliation[{$primaryLocale|escape}]" id="affiliation" value="{$affiliation.$primaryLocale|escape}" required>
		</div>
		<div class="country uk-margin">
			<label class="uk-form-label">
					{translate key="common.country"}
					<span class="required">*</span>
			</label>
					<div class="uk-inline">
						<span class="uk-form-icon" uk-icon="icon: world"></span>
						<select class="uk-select uk-form-width-large" name="country" id="country" required>
							<option></option>
							{html_options options=$countries selected=$country}
						</select>
					</div>

		</div>

		<h5 class="uk-label">{translate key="user.login"}</h5>

		<div class="email uk-margin">
			<label class="uk-form-label">
					{translate key="user.email"}
					<span class="required">*</span>
			</label>
			<div class="uk-inline">
				<span class="uk-form-icon" uk-icon="icon: mail"></span>
				<input class="uk-input uk-form-width-large" type="text" name="email" id="email" value="{$email|escape}" maxlength="90" required>
			</div>
		</div>
		<div class="username uk-margin">
			<label class="uk-form-label">
					{translate key="user.username"}
					<span class="required">*</span>
			</label>
			<div class="uk-inline">
				<span class="uk-form-icon" uk-icon="icon: user"></span>
				<input class="uk-input uk-form-width-large" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required>
			</div>
		</div>
		<div class="password uk-margin">
			<label class="uk-form-label">
					{translate key="user.password"}
					<span class="required">*</span>
			</label>
			<div class="uk-inline">
				<span class="uk-form-icon" uk-icon="icon: lock"></span>
				<input class="uk-input uk-form-width-large" type="password" name="password" id="password" password="true" maxlength="32" required>
			</div>
		</div>
		<div class="password uk-margin">
			<label class="uk-form-label">
					{translate key="user.repeatPassword"}
					<span class="required">*</span>
			</label>
			<div class="uk-inline">
				<span class="uk-form-icon" uk-icon="icon: lock"></span>
				<input class="uk-input uk-form-width-large" type="password" name="password2" id="password2" password="true" maxlength="32" required>
			</div>
		</div>
