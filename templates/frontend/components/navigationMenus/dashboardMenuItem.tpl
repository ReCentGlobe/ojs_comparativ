{**
 * templates/frontend/components/navigationMenus/dashboardMenuItem.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Dashboard menuItem Template
 *
 *}
<span class="badge is-badge-small" data-badge="{$unreadNotificationCount}">
      {$navigationMenuItem->getLocalizedTitle()}
</span>
