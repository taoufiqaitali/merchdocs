# Copyright © Magento, Inc. All rights reserved.
# See COPYING.txt for license details.

# frozen_string_literal: true

# This plugin generates site representation in JSON files at the _api directory.
#
Jekyll::Hooks.register :site, :post_write do |site|
  site.pages.each do |page|
    content = page.to_liquid.to_json
    destination_path = page.destination('_api').sub('.html', '.json')
    destination_dir = File.dirname(destination_path)
    FileUtils.makedirs destination_dir
    File.write(destination_path, content)
  end
end
