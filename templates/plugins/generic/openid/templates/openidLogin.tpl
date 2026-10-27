{**
 * plugins/generic/openid/templates/openidLogin.tpl
 *
 * Copyright (c) 2020 Leibniz Institute for Psychology Information (https://leibniz-psychology.org/)
 * Copyright (c) 2024 Simon Fraser University
 * Copyright (c) 2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file LICENSE.
 *
 * Comparativ override of the OpenID sign in page (openid plugin 5.x, OJS 3.5).
 * Uses its own provider list id so the plugin's button CSS does not apply.
 *}
{include file="frontend/components/header.tpl" pageTitle='plugins.generic.openid.select.provider'}

{capture assign="breadcrumbsHtml"}
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey='plugins.generic.openid.select.provider'}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key='plugins.generic.openid.select.provider'}}

<section class="bg-white py-12 page_openid_login">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="flex flex-col items-center">
			<div class="w-full max-w-md space-y-6">
				{if $loginMessage}
					<p class="text-primary">
						{translate key=$loginMessage}
					</p>
				{/if}

				{if $openidError}
					<div class="bg-red-50 border-l-4 border-red-500 text-red-800 p-4 rounded">
						<div>{translate key=$errorMsg supportEmail=$supportEmail}</div>
						{if $reason}
							<p class="mt-2 text-sm">{$reason}</p>
						{/if}
					</div>
					{if not $legacyLogin && not $accountDisabled}
						<div class="bg-blue-50 border-l-4 border-primary text-primary p-4 rounded [&_a]:underline">
							{translate key="plugins.generic.openid.error.legacy.link" legacyLoginUrl={url page="login" op="legacyLogin"}}
						</div>
					{/if}
				{/if}

				{if $linkList}
					<div class="bg-gray-50 rounded shadow p-8">
						<p class="font-semibold mb-4">{translate key='plugins.generic.openid.select.provider.help'}</p>
						<ul id="openid-providers" class="space-y-3">
							{foreach from=$linkList key=name item=url}
								<li>
									<a id="openid-provider-{$name}" href="{$url}" class="flex items-center gap-3 w-full px-4 py-3 border border-primary text-primary rounded hover:bg-primary hover:text-white transition font-semibold">
										{if $name == 'custom' && $customBtnImg}
											<img src="{$customBtnImg}" alt="" class="h-6 w-6 object-contain">
										{else}
											<img src="{$openIDImageURL}{$name}-sign-in.png" alt="" class="h-6 w-6 object-contain">
										{/if}
										<span>
											{if $name == 'custom' && isset($customBtnTxt)}
												{$customBtnTxt}
											{else}
												{translate key="plugins.generic.openid.select.provider.$name"}
											{/if}
										</span>
									</a>
								</li>
							{/foreach}
						</ul>
					</div>
				{/if}

				{if $legacyLogin}
					<form class="bg-gray-50 rounded shadow p-8" id="login" method="post" action="{$loginUrl}">
						{csrf}
						<p class="font-semibold mb-4">{translate key='plugins.generic.openid.select.legacy' journalName=$siteTitle|escape}</p>

						<div class="mb-4">
							<label class="block font-semibold mb-1" for="username">
								{translate key="user.username"}
								<span class="text-red-600" aria-hidden="true">*</span>
								<span class="sr-only">{translate key="common.required"}</span>
							</label>
							<div class="relative">
								<span class="absolute left-3 top-2 text-gray-400"><i class="fa fa-user"></i></span>
								<input class="border rounded px-10 py-2 w-full" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required aria-required="true">
							</div>
						</div>
						<div class="mb-4">
							<label class="block font-semibold mb-1" for="password">
								{translate key="user.password"}
								<span class="text-red-600" aria-hidden="true">*</span>
								<span class="sr-only">{translate key="common.required"}</span>
							</label>
							<div class="relative">
								<span class="absolute left-3 top-2 text-gray-400"><i class="fa fa-lock"></i></span>
								<input class="border rounded px-10 py-2 w-full" type="password" name="password" id="password" value="{$password|escape}" maxlength="32" required aria-required="true">
							</div>
							<a class="inline-block mt-1 text-xs text-primary hover:underline" href="{url page="login" op="lostPassword"}">
								{translate key="user.login.forgotPassword"}
							</a>
						</div>
						<div class="mb-4 flex items-center">
							<input class="mr-2" type="checkbox" name="remember" id="remember" value="1">
							<label for="remember" class="text-sm">{translate key="user.login.rememberUsernameAndPassword"}</label>
						</div>

						{* altcha spam blocker *}
						{if $altchaEnabled}
							<div class="altcha_wrapper mb-4">
								<altcha-widget challengejson='{$altchaChallenge|@json_encode}' floating></altcha-widget>
							</div>
						{/if}

						<button class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition w-full" type="submit">
							{translate key="user.login"}
						</button>
					</form>
				{/if}
			</div>
		</div>
	</div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
