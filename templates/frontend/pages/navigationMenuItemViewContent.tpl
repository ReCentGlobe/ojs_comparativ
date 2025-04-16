{**
 * frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display NavigationMenuItem content 
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

<h1 class="page_title text-2xl font-bold mb-4">{$title|escape}</h1>
<div class="page max-w-3xl mx-auto text-gray-700">
    {$content}
</div>

{include file="frontend/components/footer.tpl"}
