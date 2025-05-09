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


{capture name="breadcrumbs"}
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login.resetPassword"}
{/capture}
{include file="frontend/components/sectionHeader.tpl"
	breadcrumbs=$smarty.capture.breadcrumbs
	title={translate key="user.login.resetPassword"}
}

<section class="bg-white py-12">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="flex flex-col items-center">
			<div class="bg-gray-100 border-l-4 border-gray-400 text-gray-700 p-4 mb-4 rounded w-full max-w-md">
				{translate key="user.login.resetPasswordInstructions"}
			</div>
			<form class="w-full max-w-md bg-gray-50 rounded shadow p-8" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">

				{csrf}

				{if $error}
					<div class="bg-yellow-100 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-4 rounded">
						{translate key=$error}
					</div>
				{/if}

				<div class="mb-4">
					<label class="block font-semibold mb-1" for="email">
						{translate key="user.login.registeredEmail"}
					</label>
					<div class="relative">
						<span class="absolute left-3 top-2 text-gray-400"><i class="fa fa-envelope"></i></span>
						<input class="border rounded px-10 py-2 w-full" type="text" name="email" id="email" value="{$email|escape}" required>
					</div>
				</div>
				<div class="flex gap-4 mt-6">
					<button class="inline-block px-4 py-2 border border-red-500 text-red-600 rounded hover:bg-red-500 hover:text-white transition w-1/2" type="submit">
						{translate key="user.login.resetPassword"}
					</button>
					{if !$disableUserReg}
						{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
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
