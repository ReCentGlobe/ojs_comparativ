{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}
		<h1 class="uk-h2 uk-margin-remove-top">
			Login
		</h1>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium">
	<div class="uk-container">
		<div uk-grid>
			<div class="uk-width-1-1 uk-first-column uk-flex uk-flex-middle uk-flex-center">
				{* A login message may be displayed if the user was redireceted to the
   login page from another request. Examples include if login is required
   before dowloading a file. *}
				{if $loginMessage}
					<p>
						{translate key=$loginMessage}
					</p>
				{/if}
			</div>
			<div class="uk-width-1-1 uk-first-column uk-flex uk-flex-middle uk-flex-center">
				<form class="uk-form-stacked" id="login" method="post" action="{$loginUrl}">
					{csrf}

					{if $error}
						<div class="uk-alert-warning" uk-alert>
							{translate key=$error reason=$reason}
						</div>
					{/if}

					<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />


					<div class="username uk-margin">
						<label class="uk-form-label">
							{translate key="user.username"}
						</label>
						<div class="uk-inline uk-width-1-1">
							<span class="uk-form-icon" uk-icon="icon: user"></span>
							<input class="uk-input " type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required>
						</span>
						</div>
					</div>
					<div class="password uk-margin">
						<label class="uk-form-label">
							{translate key="user.password"}
						</label>
						<div class="uk-inline uk-width-1-1">
							<span class="uk-form-icon" uk-icon="icon: lock"></span>
							<input class="uk-input " type="password" name="password" id="password" value="{$password|escape}" password="true" maxlength="32" required>
						</span>
							<a class="uk-form-label help" href="{url page="login" op="lostPassword"}">
								{translate key="user.login.forgotPassword"}
							</a>
						</div>
					</div>
					<div class="remember uk-margin">
						<label class="uk-form-label">
							<input class="uk-checkbox" type="checkbox" name="remember" id="remember" value="1" checked="$remember">
							{translate key="user.login.rememberUsernameAndPassword"}
						</label>
					</div>
					<div class="uk-margin uk-flex uk-flex-center" uk-grid>
							<div class="uk-width-1-2">
								<button class="uk-button uk-button-primary" type="submit">
									{translate key="user.login"}
								</button>
							</div>
						<div class="uk-width-1-2">
							{if !$disableUserReg}
								{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
								<a href="{$registerUrl}" class="btn btn-secondary">
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
