{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}



</div><!-- pkp_structure_content -->

<footer id="pkp_content_footer" class="bg-white text-gray-800 pt-16 pb-8 rounded-t-3xl shadow-lg mt-20" role="contentinfo">
  <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 border-b border-gray-100 pb-8 mb-8">
      <div>
        <h3 class="text-lg font-sans font-semibold tracking-wide uppercase mb-4 text-primary">About Us</h3>
        {load_menu name="footer" id="" dark=false ulClass="space-y-1" liClass="text-gray-700 hover:text-primary transition-colors font-serif px-2 py-1 rounded hover:bg-gray-100"}
      </div>
      <div>
        <h3 class="text-lg font-sans font-semibold tracking-wide uppercase mb-4 text-primary">Sections</h3>
        {load_menu name="footer2" id="" dark=false ulClass="space-y-1" liClass="text-gray-700 hover:text-primary transition-colors font-serif px-2 py-1 rounded hover:bg-gray-100"}
      </div>
      <div>
        <h3 class="text-lg font-sans font-semibold tracking-wide uppercase mb-4 text-primary">Subscriptions</h3>
        {load_menu name="footer3" id="" dark=false ulClass="space-y-1" liClass="text-gray-700 hover:text-primary transition-colors font-serif px-2 py-1 rounded hover:bg-gray-100"}
      </div>
      <div role="complementary">
        <h3 class="text-lg font-sans font-semibold tracking-wide uppercase mb-4 text-primary">Legal Notices</h3>
        <div class="mb-3 p-3 bg-gray-50 rounded text-gray-500 font-serif text-sm leading-relaxed shadow-sm">
          {$pageFooter}
        </div>
        {load_menu name="footer4" id="" dark=false ulClass="space-y-1" liClass="text-gray-700 hover:text-primary transition-colors font-serif px-2 py-1 rounded hover:bg-gray-100"}
      </div>
    </div>
    <div class="text-center text-xs text-gray-400 font-serif">
      &copy; {"now"|date_format:"%Y"} {translate key="context.current"} &mdash; All rights reserved. ISSN 0940-3566
    </div>
  </div>
</footer><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
