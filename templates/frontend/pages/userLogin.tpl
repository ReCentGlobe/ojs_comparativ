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

{capture assign="breadcrumbsHtml"}
  {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="user.login"}}

<section class="bg-white py-12">
	<div class="container mx-auto">
		<div class="flex flex-col items-center">
			{* A login message may be displayed if the user was redirected to the login page from another request. *}
			{if $loginMessage}
				<p class="mb-4 text-primary">
					{translate key=$loginMessage}
				</p>
			{/if}
			<form class="w-full max-w-md bg-gray-50 rounded shadow p-8" id="login" method="post" action="{$loginUrl}">
				{csrf}

				{if $error}
					<div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-4 rounded">
						{translate key=$error reason=$reason}
					</div>
				{/if}

				<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

				<div class="mb-4">
					<label class="block font-semibold mb-1" for="username">
						{translate key="user.username"}
					</label>
					<div class="relative">
						<span class="absolute left-3 top-2 text-gray-400"><i class="fa fa-user"></i></span>
						<input class="border rounded px-10 py-2 w-full" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required>
					</div>
				</div>
				<div class="mb-4">
					<label class="block font-semibold mb-1" for="password">
						{translate key="user.password"}
					</label>
					<div class="relative">
						<span class="absolute left-3 top-2 text-gray-400"><i class="fa fa-lock"></i></span>
						<input class="border rounded px-10 py-2 w-full" type="password" name="password" id="password" value="{$password|escape}" maxlength="32" required>
						<a class="absolute right-3 top-2 text-xs text-primary hover:underline" href="{url page="login" op="lostPassword"}">
							{translate key="user.login.forgotPassword"}
						</a>
					</div>
				</div>
				<div class="mb-4 flex items-center">
					<input class="mr-2" type="checkbox" name="remember" id="remember" value="1" checked="$remember">
					<label for="remember" class="text-sm">{translate key="user.login.rememberUsernameAndPassword"}</label>
				</div>
				<div class="flex gap-4 mt-6">
					<button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition w-1/2" type="submit">
						{translate key="user.login"}
					</button>
					{if !$disableUserReg}
						{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
						<a href="{$registerUrl}" class="inline-block px-4 py-2 border border-gray-400 text-gray-700 rounded hover:bg-gray-200 transition w-1/2 text-center">
							{translate key="user.login.registerNewAccount"}
						</a>
					{/if}
				</div>
			</form>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
