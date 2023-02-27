{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Primary navigation menu list for OJS
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	<ul class="{$ulClass|escape}">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}

      	{if empty($navigationMenuItemAssignment->children)}
					<li class="{$liClass|escape}">
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
													{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
					</li>
				{/if}


				{if !empty($navigationMenuItemAssignment->children)}
					<li class="uk-nav-parent {$liClass|escape}">
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
						<div class="uk-navbar-dropdown uk-navbar-dropdown-dropbar">
							<ul class="uk-nav uk-navbar-dropdown-nav">
								{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
									{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
											<li>
												<a href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
													{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
												</a>
											</li>
									{/if}
								{/foreach}
							</ul>
						</div>
					</li>
				{/if}

		{/foreach}
	</ul>
{/if}
