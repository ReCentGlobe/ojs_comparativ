{**
 * templates/frontend/components/primaryNavMenu.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Primary navigation menu list for OJS
 *}
<button id="mobile-nav-toggle" class="md:hidden flex items-center px-3 py-2 border border-gray-400 rounded text-gray-800 dark:text-gray-200 hover:text-accent hover:border-accent focus:outline-none" aria-label="Open menu">
  <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/></svg>
</button>

<ul id="navigationPrimary" class="flex flex-col md:flex-row gap-2 md:gap-6 items-start md:items-center text-base font-medium text-gray-800 dark:text-gray-200 w-full md:w-auto px-2 md:px-0 hidden md:flex">

	{if $enableAnnouncements}
			<li class="hover:text-accent transition-colors px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 w-full md:w-auto">
				<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}" class="block text-gray-800 dark:text-gray-200 hover:text-blue-600 dark:hover:text-accent w-full md:w-auto">
					{translate key="announcement.announcements"}
				</a>
			</li>
	{/if}

	{if $currentJournal}

		{if $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
				<li class="hover:text-accent transition-colors px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 w-full md:w-auto">
					<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}" class="block text-gray-800 dark:text-gray-200 hover:text-blue-600 dark:hover:text-accent w-full md:w-auto">
						{translate key="navigation.current"}
					</a>
				</li>
				<li class="hover:text-accent transition-colors px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 w-full md:w-auto">
					<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="block text-gray-800 dark:text-gray-200 hover:text-blue-600 dark:hover:text-accent w-full md:w-auto">
						{translate key="navigation.archives"}
					</a>
				</li>
		{/if}

		<li class="group relative hover:text-accent transition-colors px-4 py-2 w-full md:w-auto">
			<a href="{url router=$smarty.const.ROUTE_PAGE page="about"}" class="block text-gray-800 dark:text-gray-200 hover:text-blue-600 dark:hover:text-accent w-full md:w-auto">
				{translate key="navigation.about"}
			</a>
			<div class="hidden group-hover:block md:absolute left-0 mt-2 w-full md:w-48 bg-white dark:bg-gray-800 border-gray-200 dark:border-gray-700 border rounded shadow-lg z-50">
				<ul class="py-2">
					<li>
						<a href="{url router=$smarty.const.ROUTE_PAGE page="about"}" class="block px-4 py-2 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-blue-600 dark:hover:text-accent">
							{translate key="about.aboutContext"}
						</a>
					</li>
					{if $currentJournal->getLocalizedSetting('masthead')}
						<li>
							<a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="editorialTeam"}" class="block px-4 py-2 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-blue-600 dark:hover:text-accent">
								{translate key="about.editorialTeam"}
							</a>
						</li>
					{/if}
					<li>
						<a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}" class="block px-4 py-2 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-blue-600 dark:hover:text-accent">
							{translate key="about.submissions"}
						</a>
					</li>
					{if $currentJournal->getSetting('mailingAddress') || $currentJournal->getSetting('contactName')}
						<li>
							<a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}" class="block px-4 py-2 text-gray-700 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700 hover:text-blue-600 dark:hover:text-accent">
								{translate key="about.contact"}
							</a>
						</li>
					{/if}
				</ul>
			</div>
		</li>
	{/if}
</ul>
