{**
 * templates/frontend/components/editLink.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $page string Page to pass to the url constructor
 * @uses $op string Op to pass to the url constructor
 * @uses $path string Path to pass to the url constructor
 * @uses $anchor string Anchor to pass to the url constructor
 * @uses $sectionTitle string Translated name of section to be edited
 * @uses SectionTitleKey string A key that must be translated to get the
 *       $sectionTitle
 *}
{if in_array(ROLE_ID_MANAGER, (array) $userRoles)}

	{* Render the $sectionTitle if we only have a translation key *}
	{if $sectionTitleKey}
		{capture assign='sectionTitle'}{translate key=$sectionTitleKey}{/capture}
	{/if}

	<a href="{url page=$page op=$op path=$path anchor=$anchor}" class="inline-flex items-center px-2 py-1 text-xs font-medium text-white bg-primary rounded hover:bg-accent focus:outline-none focus:ring-2 focus:ring-accent focus:ring-offset-2">
		{translate key="common.edit"}

		{* Screen readers need more context *}
		<span class="sr-only">
			{translate key="help.goToEditPage" sectionTitle=$sectionTitle}
		</span>
	</a>
{/if}
