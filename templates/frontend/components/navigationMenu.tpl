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
					<li class="{$liClass|escape} px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700">
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" class="block text-gray-800 dark:text-gray-200 hover:text-blue-600 dark:hover:text-accent">
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
					</li>
				{/if}


				{if !empty($navigationMenuItemAssignment->children)}
					<li class="group relative {$liClass|escape} px-4 py-2">
						<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" class="block text-gray-800 dark:text-gray-200 hover:text-blue-600 dark:hover:text-accent">
							{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						</a>
						<div class="absolute left-0 mt-2 w-48 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded shadow-lg opacity-0 group-hover:opacity-100 group-hover:pointer-events-auto transition-opacity duration-200 z-50 pointer-events-none">
							<ul class="py-2">
								{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
									{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
											<li>
												<a href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}" class="block px-4 py-2 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-blue-600 dark:hover:text-accent">
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
