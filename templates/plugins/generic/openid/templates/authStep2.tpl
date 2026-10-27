{**
 * plugins/generic/openid/templates/authStep2.tpl
 *
 * Copyright (c) 2020 Leibniz Institute for Psychology Information (https://leibniz-psychology.org/)
 * Copyright (c) 2024 Simon Fraser University
 * Copyright (c) 2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file LICENSE.
 *
 * Comparativ override of the OpenID second step: connect an existing account
 * or register a new one (openid plugin 5.x, OJS 3.5). The plugin's scripts.js
 * relies on .page_oauth, #oauth, #returnTo, #showLoginForm, #showRegisterForm,
 * #login-form, #register-form, #emailConsent and .reviewerGroupInput.
 *}
{include file="frontend/components/header.tpl" pageTitle="plugins.generic.openid.step2.title"}

{capture assign="breadcrumbsHtml"}
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="plugins.generic.openid.step2.title"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="plugins.generic.openid.step2.title"}}

<section class="bg-white py-12 page_oauth">
	<div class="container max-w-2xl mx-auto px-4">
		<form class="w-full bg-gray-50 rounded shadow p-8" id="oauth" method="post" action="{url page="openid" op="registerOrConnect"}">
			{csrf}
			<input type="hidden" name="oauthId" id="oauthId" value="{$oauthId}">
			<input type="hidden" name="selectedProvider" id="selectedProvider" value="{$selectedProvider}">
			<input type="hidden" name="returnTo" id="returnTo" value="{$returnTo}">

			{if $siteTitle}
				{assign var="headline" value="{translate key='plugins.generic.openid.step2.headline' journalName=$siteTitle|escape}"}
				{assign var="choiceNo" value="{translate key="plugins.generic.openid.step2.choice.no" journalName=$siteTitle|escape}"}
				{assign var="connect" value="{translate key="plugins.generic.openid.step2.connect" journalName=$siteTitle|escape}"}
				{assign var="help" value="{translate key="plugins.generic.openid.step2.help" journalName=$siteTitle|escape}"}
			{else}
				{assign var="headline" value="{translate key='plugins.generic.openid.step2.headline.siteNameMissing'}"}
				{assign var="choiceNo" value="{translate key='plugins.generic.openid.step2.choice.no.siteNameMissing'}"}
				{assign var="connect" value="{translate key='plugins.generic.openid.step2.connect.siteNameMissing'}"}
				{assign var="help" value="{translate key='plugins.generic.openid.step2.help.siteNameMissing'}"}
			{/if}

			{if empty($disableConnect) || $disableConnect != "1"}
				<h2 class="font-sans text-xl font-semibold text-primary mb-4">{$headline}</h2>
				<div class="flex flex-col sm:flex-row gap-4 mb-8">
					<span id="showLoginForm" role="button" tabindex="0" class="flex-1 text-center cursor-pointer px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition">
						{translate key="plugins.generic.openid.step2.choice.yes"}
					</span>
					<span id="showRegisterForm" role="button" tabindex="0" class="flex-1 text-center cursor-pointer px-4 py-2 border border-gray-400 text-gray-700 rounded hover:bg-gray-200 transition">
						{$choiceNo}
					</span>
				</div>
			{/if}

			<div {if empty($disableConnect) || $disableConnect != "1"}id="register-form"{/if} class="page_register">
				<div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-800 p-4 mb-6 rounded">
					{$help}
				</div>
				{if $returnTo == 'register' && $isError}
					<div class="bg-red-50 border-l-4 border-red-500 text-red-800 p-4 mb-6 rounded text-sm">
						{include file="common/formErrors.tpl"}
					</div>
				{/if}

				<fieldset class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-6">
					<div>
						<label class="block font-semibold mb-1" for="givenName">{translate key="user.givenName"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="givenName" id="givenName" value="{$givenName|escape}" maxlength="255" required aria-required="true">
					</div>
					<div>
						<label class="block font-semibold mb-1" for="familyName">{translate key="user.familyName"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="familyName" id="familyName" value="{$familyName|escape}" maxlength="255">
					</div>
					<div>
						<label class="block font-semibold mb-1" for="email">{translate key="user.email"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<input class="border rounded px-3 py-2 w-full" type="email" name="email" id="email" value="{$email|escape}" maxlength="90" required aria-required="true">
					</div>
					<div>
						<label class="block font-semibold mb-1" for="username">{translate key="user.username"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required aria-required="true">
					</div>
					<div>
						<label class="block font-semibold mb-1" for="affiliation">{translate key="user.affiliation"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="affiliation" id="affiliation" value="{$affiliation|escape}" required aria-required="true">
					</div>
					<div>
						<label class="block font-semibold mb-1" for="country">{translate key="common.country"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<select class="border rounded px-3 py-2 w-full bg-white" name="country" id="country" required aria-required="true">
							<option></option>
							{html_options options=$countries selected=$country}
						</select>
					</div>
				</fieldset>

				<fieldset class="space-y-3 mb-6 text-sm [&_a]:text-accent [&_a]:underline">
					{if isset($privacyStatement)}
						{* Require the user to agree to the terms of the privacy policy *}
						<label class="flex items-start gap-2">
							<input class="mt-1" type="checkbox" name="privacyConsent" value="1" required{if $privacyConsent} checked="checked"{/if}>
							<span>
								{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
								{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
								<span class="text-red-600" aria-hidden="true">*</span>
								<span class="sr-only">{translate key="common.required"}</span>
							</span>
						</label>
					{/if}
					{* Ask the user to opt into public email notifications *}
					<label class="flex items-start gap-2">
						<input class="mt-1" type="checkbox" name="emailConsent" id="emailConsent" value="1" {if $emailConsent} checked="checked"{/if}>
						<span>{translate key="user.register.form.emailConsent"}</span>
					</label>
				</fieldset>

				{* Allow the user to sign up as a reviewer *}
				{assign var=userCanRegisterReviewer value=0}
				{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
					{if $userGroup->permitSelfRegistration}
						{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
					{/if}
				{/foreach}
				{if $userCanRegisterReviewer}
					<fieldset class="border border-gray-200 rounded p-4 mb-6 text-sm">
						{if $userCanRegisterReviewer > 1}
							<legend class="font-semibold px-1">{translate key="user.reviewerPrompt"}</legend>
							{capture assign="checkboxLocaleKey"}user.reviewerPrompt.userGroup{/capture}
						{else}
							{capture assign="checkboxLocaleKey"}user.reviewerPrompt.optin{/capture}
						{/if}
						<div id="reviewerOptinGroup" class="space-y-2">
							{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
								{if $userGroup->permitSelfRegistration}
									{assign var="userGroupId" value=$userGroup->id}
									<label class="flex items-start gap-2">
										<input class="mt-1 reviewerGroupInput" type="checkbox" name="reviewerGroup[{$userGroupId}]" value="1"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
										<span>{translate key=$checkboxLocaleKey userGroup=$userGroup->getLocalizedData('name')}</span>
									</label>
								{/if}
							{/foreach}
						</div>
						<div id="reviewerInterests" class="mt-3">
							<label class="block font-semibold mb-1" for="interests">{translate key="user.interests"}</label>
							<input class="border rounded px-3 py-2 w-full reviewerGroupInput" type="text" name="interests" id="interests" value="{$interests|escape}">
						</div>
					</fieldset>
				{/if}

				<button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition w-full" type="submit" name="register">
					{translate key="plugins.generic.openid.step2.complete.btn"}
				</button>
			</div>

			{if empty($disableConnect) || $disableConnect != "1"}
				<div id="login-form">
					<div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-800 p-4 mb-6 rounded">
						{$connect}
					</div>
					{if $returnTo == 'connect' && $isError}
						<div class="bg-red-50 border-l-4 border-red-500 text-red-800 p-4 mb-6 rounded text-sm">
							{include file="common/formErrors.tpl"}
						</div>
					{/if}
					<div class="mb-4">
						<label class="block font-semibold mb-1" for="usernameLogin">{translate key="plugins.generic.openid.step2.connect.username"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<input class="border rounded px-3 py-2 w-full" type="text" name="usernameLogin" id="usernameLogin" value="{$usernameLogin|escape}" maxlength="32" required aria-required="true">
					</div>
					<div class="mb-6">
						<label class="block font-semibold mb-1" for="passwordLogin">{translate key="user.password"} <span class="text-red-600" aria-hidden="true">*</span><span class="sr-only">{translate key="common.required"}</span></label>
						<input class="border rounded px-3 py-2 w-full" type="password" name="passwordLogin" id="passwordLogin" value="{$passwordLogin|escape}" maxlength="32" required aria-required="true">
						<a class="inline-block mt-1 text-xs text-primary hover:underline" href="{url page="login" op="lostPassword"}">{translate key="user.login.forgotPassword"}</a>
					</div>
					<button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition w-full" type="submit" name="connect">
						{translate key="plugins.generic.openid.step2.connect.btn"}
					</button>
				</div>
			{/if}
		</form>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
