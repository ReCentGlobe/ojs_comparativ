{**
 * templates/frontend/pages/userRegisterComplete.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief A landing page displayed to users upon successful registration
 *}
{include file="frontend/components/header.tpl"}

<section class="bg-primary py-8">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
		<h1 class="text-2xl font-bold text-white mt-0">Registration complete</h1>
	</div>
</section>

<section class="bg-white py-12">
	<div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="w-full max-w-xl mx-auto bg-green-50 border-l-4 border-green-500 text-green-900 p-6 mb-8 rounded">
			{translate key="user.login.registrationComplete.instructions"}
		</div>
		<div class="flex gap-4 justify-center">
			<a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition w-1/2 text-center" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="profile"}">
				{translate key="user.editMyProfile"}
			</a>
			<a class="inline-block px-4 py-2 border border-gray-400 text-gray-700 rounded hover:bg-gray-200 transition w-1/2 text-center" href="{url page="index"}">
				{translate key="user.login.registrationComplete.continueBrowsing"}
			</a>
		</div>
	</div>
</section>

{include file="frontend/components/footer.tpl"}
