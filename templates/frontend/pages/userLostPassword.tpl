{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login.resetPassword"}
		<h1 class="uk-h2 uk-margin-remove-top">
			Reset Password
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">

		<div uk-grid>
			<div class="uk-width-1-1">
				<div class="uk-alert-default" uk-alert>{translate key="user.login.resetPasswordInstructions"}</div>
			</div>
			<div class="uk-width-1-1 uk-flex uk-flex-middle uk-flex-center">
				<form class="uk-form-stacked" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">

				{csrf}

				{if $error}
					<div class="uk-alert-warning" uk-alert>
						{translate key=$error}
					</div>
				{/if}


				<div class="email uk-margin">
					<label class="uk-form-label">
							{translate key="user.login.registeredEmail"}
					</label>
					<div class="uk-inline uk-width-1-1">
						<span class="uk-form-icon" uk-icon="icon: mail"></span>
						<input class="uk-input" type="text" name="email" id="email" value="{$email|escape}" required>
					</div>
				</div>
				<div class="uk-margin uk-flex uk-flex-center" uk-grid>


						<div class="uk-width-auto">
							<button class="uk-button uk-button-danger" type="submit">
								{translate key="user.login.resetPassword"}
							</button>
						</div>
						<div class="uk-width-auto">
							{if !$disableUserReg}
								{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
								<a href="{$registerUrl}" class="uk-button uk-button-default">
									{translate key="user.login.registerNewAccount"}
								</a>
							{/if}
						</div>


				</div>


			</form>
			</div>
		</div>

</div>

</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
