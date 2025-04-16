{**
 * templates/content.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display Static Page content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

<section class="bg-primary py-8">
    <div class="container mx-auto animate-fadeIn">
        {include file="frontend/components/breadcrumbs.tpl" currentTitle=$title}
        <h1 class="text-2xl font-bold text-white mt-0">{$title|escape}</h1>
    </div>
</section>

<section class="bg-white py-12">
    <div class="container mx-auto">
        <div class="w-full">{$content}</div>
    </div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
