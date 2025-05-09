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

		<h5 class="text-lg font-bold mb-4 text-primary">{translate key="user.profile"}</h5>

		<div class="first_name mb-4">
			<label class="block font-semibold mb-1">
					{translate key="user.givenName"}
					<span class="text-red-600">*</span>
			</label>
			<input class="border rounded px-3 py-2 w-full" type="text" name="givenName" id="givenName" value="{$givenName|escape}" maxlength="80" required>
		</div>
		<div class="last_name mb-4">
			<label class="block font-semibold mb-1">
					{translate key="user.familyName"}
					<span class="text-red-600">*</span>
			</label>
			<input class="border rounded px-3 py-2 w-full" type="text" name="familyName" id="familyName" value="{$familyName|escape}" maxlength="80" required>
		</div>
		<div class="affiliation mb-4">
			<label class="block font-semibold mb-1">
					{translate key="user.affiliation"}
					<span class="text-red-600">*</span>
			</label>
			<input class="border rounded px-3 py-2 w-full" type="text" name="affiliation[{$primaryLocale|escape}]" id="affiliation" value="{$affiliation.$primaryLocale|escape}" required>
		</div>
		<div class="country mb-4">
			<label class="block font-semibold mb-1">
					{translate key="common.country"}
					<span class="text-red-600">*</span>
			</label>
					<div>
						<select class="border rounded px-3 py-2 w-full" name="country" id="country" required>
							<option></option>
							{html_options options=$countries selected=$country}
						</select>
					</div>

		</div>

		<h5 class="text-lg font-bold mb-4 text-primary">{translate key="user.login"}</h5>

		<div class="email mb-4">
			<label class="block font-semibold mb-1">
					{translate key="user.email"}
					<span class="text-red-600">*</span>
			</label>
			<input class="border rounded px-3 py-2 w-full" type="text" name="email" id="email" value="{$email|escape}" maxlength="90" required>
		</div>
		<div class="username mb-4">
			<label class="block font-semibold mb-1">
					{translate key="user.username"}
					<span class="text-red-600">*</span>
			</label>
			<input class="border rounded px-3 py-2 w-full" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required>
		</div>
		<div class="password mb-4">
			<label class="block font-semibold mb-1">
					{translate key="user.password"}
					<span class="text-red-600">*</span>
			</label>
			<input class="border rounded px-3 py-2 w-full" type="password" name="password" id="password" password="true" maxlength="32" required>
		</div>
		<div class="password mb-4">
			<label class="block font-semibold mb-1">
					{translate key="user.repeatPassword"}
					<span class="text-red-600">*</span>
			</label>
			<input class="border rounded px-3 py-2 w-full" type="password" name="password2" id="password2" password="true" maxlength="32" required>
		</div>
