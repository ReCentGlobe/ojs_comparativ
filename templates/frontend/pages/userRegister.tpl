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

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

	<div class="uk-container">
		{* Display a message if no current issue exists *}
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.purchaseInstitutionalSubscription"}

		<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
			Registration
		</h1>

	</div>

</section>

<section class="uk-section-default uk-section uk-section-medium" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:200&#125">
	<div class="uk-container">
		<form class="uk-form-stacked registration" id="register" method="post" action="{url op="register"}">
      {csrf}

      {if $source}
				<input type="hidden" name="source" value="{$source|escape}" />
      {/if}

     	{include file="common/formErrors.tpl"}


      {include file="frontend/components/registrationForm.tpl"}

      {* When a user is registering with a specific journal *}
      {if $currentContext}


					{* Require the user to agree to the terms of the privacy policy *}
					<div class="consent">
						<div class="optin optin-privacy uk-margin">
							<label class="uk-form-label">
								<input class="uk-checkbox" type="checkbox" name="privacyConsent" value="1"{if $privacyConsent} checked="checked"{/if}>
								{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
								{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
							</label>
						</div>
					</div>
					{* Ask the user to opt into public email notifications *}
					<div class="fields">
						<div class="optin optin-email uk-margin">
							<label class="uk-form-label">
								<input class="uk-checkbox" type="checkbox" name="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}>
								{translate key="user.register.form.emailConsent"}
							</label>
						</div>
					</div>


        {* Users are opted into the Reader and Author roles in the current
           journal/press by default. See RegistrationForm::initData() *}
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

        {* Allow the user to sign up as a reviewer *}
        {assign var=userCanRegisterReviewer value=0}
        {foreach from=$reviewerUserGroups[$contextId] item=userGroup}
          {if $userGroup->getPermitSelfRegistration()}
            {assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
          {/if}
        {/foreach}
        {if $userCanRegisterReviewer}
					<div class="reviewer">
						<legend>
              {translate key="user.reviewerPrompt"}
						</legend>
						<div class="uk-margin">
							<div id="reviewerOptinGroup" class="optin">
                {foreach from=$reviewerUserGroups[$contextId] item=userGroup}
                  {if $userGroup->getPermitSelfRegistration()}
										<label class="uk-form-label">
                      {assign var="userGroupId" value=$userGroup->getId()}
											<input class="uk-checkbox" type="checkbox" name="reviewerGroup[{$userGroupId}]" value="1"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
                      {translate key="user.reviewerPrompt.userGroup" userGroup=$userGroup->getLocalizedName()}
										</label>
                  {/if}
                {/foreach}
							</div>

							<div id="reviewerInterests" class="reviewer_interests">
                {*
                 * This container will be processed by the tag-it jQuery
                 * plugin. In order for it to work, your theme will need to
                 * load the jQuery tag-it plugin and initialize the
                 * component.
                 *
                 * Two data attributes are added which are not a default
                 * feature of the plugin. These are converted into options
                 * when the plugin is initialized on the element.
                 *
                 * See: /plugins/themes/default/js/main.js
                 *
                 * `data-field-name` represents the name used to POST the
                 * interests when the form is submitted.
                 *
                 * `data-autocomplete-url` is the URL used to request
                 * existing entries from the server.
                 *
                 * @link: http://aehlke.github.io/tag-it/
                 *}
								<div class="label">
                  {translate key="user.interests"}
								</div>
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

      {* When a user is registering for no specific journal, allow them to
         enter their reviewer interests *}
      {if !$currentContext}
				<fieldset class="reviewer_nocontext_interests">
					<legend>
            {translate key="user.register.noContextReviewerInterests"}
					</legend>
					<div class="fields">
						<div class="reviewer_nocontext_interests">
              {* See comment for .tag-it above *}
							<ul class="interests tag-it" data-field-name="interests[]" data-autocomplete-url="{url|escape router=$smarty.const.ROUTE_PAGE page='user' op='getInterests'}">
                {foreach from=$interests item=interest}
									<li>{$interest|escape}</li>
                {/foreach}
							</ul>
						</div>
					</div>
				</fieldset>
      {/if}

      {* recaptcha spam blocker *}
      {if $reCaptchaHtml}
				<fieldset class="recaptcha_wrapper">
					<div class="fields">
						<div class="recaptcha">
              {$reCaptchaHtml}
						</div>
					</div>
				</fieldset>
      {/if}



				<div class="uk-margin uk-flex uk-flex-center uk-text-center" uk-grid>
					<div class="uk-width-1-2">
						<button class="uk-button uk-button-primary submit" type="submit">
							{translate key="user.register"}
						</button>
					</div>
					<div class="uk-width-1-2">
						{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
						<a href="{url page="login" source=$rolesProfileUrl}" class="uk-button uk-button-default login">{translate key="user.login"}</a>
					</div>
				</div>



		</form>

	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
