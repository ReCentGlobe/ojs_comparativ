{**
 * templates/frontend/pages/userRegister.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * @uses $primaryLocale string The primary locale for this journal/press
 *}
{include file="frontend/components/header.tpl" pageTitle="user.register"}

<section class="bg-primary py-8">
	<div class="container mx-auto animate-fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.purchaseInstitutionalSubscription"}
		<h1 class="text-2xl font-bold text-white mt-0">Registration</h1>
	</div>
</section>

<section class="bg-white py-12">
	<div class="container mx-auto">
		<form class="w-full max-w-2xl mx-auto bg-gray-50 rounded shadow p-8 registration" id="register" method="post" action="{url op="register"}">
			{csrf}

			{if $source}
				<input type="hidden" name="source" value="{$source|escape}" />
			{/if}

			{include file="common/formErrors.tpl"}
			{include file="frontend/components/registrationForm.tpl"}

			{if $currentContext}
				<div class="consent mb-4">
					<div class="optin optin-privacy mb-2">
						<label class="inline-flex items-center">
							<input class="mr-2" type="checkbox" name="privacyConsent" value="1"{if $privacyConsent} checked="checked"{/if}>
							{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
							{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
						</label>
					</div>
				</div>
				<div class="fields mb-4">
					<div class="optin optin-email">
						<label class="inline-flex items-center">
							<input class="mr-2" type="checkbox" name="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}>
							{translate key="user.register.form.emailConsent"}
						</label>
					</div>
				</div>
				{assign var=contextId value=$currentContext->getId()}
				{foreach from=$readerUserGroups[$contextId] item=userGroup}
					{if in_array($userGroup->getId(), $userGroupIds)}
						{assign var="userGroupId" value=$userGroup->getId()}
						<input type="hidden" name="readerGroup[{$userGroupId}]" value="1">
					{/if}
				{/foreach}
				{foreach from=$authorUserGroups[$contextId] item=userGroup}
					{if in_array($userGroup->getId(), $userGroupIds)}
						{assign var="userGroupId" value=$userGroup->getId()}
						<input type="hidden" name="authorGroup[{$userGroupId}]" value="1">
					{/if}
				{/foreach}
				{assign var=userCanRegisterReviewer value=0}
				{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
					{if $userGroup->getPermitSelfRegistration()}
						{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
					{/if}
				{/foreach}
				{if $userCanRegisterReviewer}
					<div class="reviewer mb-4">
						<legend class="font-semibold mb-2">{translate key="user.reviewerPrompt"}</legend>
						<div>
							<div id="reviewerOptinGroup" class="optin mb-2">
								{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
									{if $userGroup->getPermitSelfRegistration()}
										<label class="inline-flex items-center mr-4">
											{assign var="userGroupId" value=$userGroup->getId()}
											<input class="mr-2" type="checkbox" name="reviewerGroup[{$userGroupId}]" value="1"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
											{translate key="user.reviewerPrompt.userGroup" userGroup=$userGroup->getLocalizedName()}
										</label>
									{/if}
								{/foreach}
							</div>
							<div id="reviewerInterests" class="reviewer_interests">
								<div class="label mb-1">{translate key="user.interests"}</div>
								<ul class="interests tag-it" data-field-name="interests[]" data-autocomplete-url="{url|escape router=$smarty.const.ROUTE_PAGE page='user' op='getInterests'}">
									{foreach from=$interests item=interest}
										<li>{$interest|escape}</li>
									{/foreach}
								</ul>
							</div>
						</div>
					</div>
				{/if}
			{/if}

			{include file="frontend/components/registrationFormContexts.tpl"}

			{if !$currentContext}
				<fieldset class="reviewer_nocontext_interests mb-4">
					<legend class="font-semibold mb-2">{translate key="user.register.noContextReviewerInterests"}</legend>
					<div class="fields">
						<div class="reviewer_nocontext_interests">
							<ul class="interests tag-it" data-field-name="interests[]" data-autocomplete-url="{url|escape router=$smarty.const.ROUTE_PAGE page='user' op='getInterests'}">
								{foreach from=$interests item=interest}
									<li>{$interest|escape}</li>
								{/foreach}
							</ul>
						</div>
					</div>
				</fieldset>
			{/if}

			{if $reCaptchaHtml}
				<fieldset class="recaptcha_wrapper mb-4">
					<div class="fields">
						<div class="recaptcha">{$reCaptchaHtml}</div>
					</div>
				</fieldset>
			{/if}

			<div class="flex gap-4 mt-6">
				<button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition w-1/2" type="submit">
					{translate key="user.register"}
				</button>
				{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
				<a href="{url page="login" source=$rolesProfileUrl}" class="inline-block px-4 py-2 border border-gray-400 text-gray-700 rounded hover:bg-gray-200 transition w-1/2 text-center login">
					{translate key="user.login"}
				</a>
			</div>
		</form>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
