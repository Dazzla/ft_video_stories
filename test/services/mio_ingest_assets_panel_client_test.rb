require 'test/unit'
require_relative '../test_helper'
require_relative '../../lib/web_service_clients/mio_create_ingest_asset_webservice_client'
require_relative '../../test/data/ws_user'

class MioIngestAssetsPanelClientTest < MioTest


  def setup
    @mio_ingest_assets_panel_client = MioCreateIngestAssetWebserviceClient.new(WSUser.new)
    @mio_metadata_service = MioMetadataDescriptionWebserviceClient.new(WSUser.new)
  end

  def test_build_url_for_data_definition
    panel_name = 'ingest-metadata'
    id = @mio_metadata_service.retrieve_id_with_name(panel_name)
    url = @mio_ingest_assets_panel_client.build_url_for_data_definition
    assert_match(/api\/metadataDefinitions\/#{id}\/definition/, url)
  end

  def test_extract_ingest_asset_panel_elements
    @ingest_panel_elements = @mio_ingest_assets_panel_client.extract_panel_elements
    assert_kind_of(Hash, @ingest_panel_elements)
    assert(@ingest_panel_elements.has_key?('clip-description') || @ingest_panel_elements.has_key?('text'),
           'Does not have expected element (project => text)')
  end

  def test_retrieve_ingest_panel_definitions
    ingest_panel_definitions = @mio_ingest_assets_panel_client.retrieve_panel_definitions
    assert_kind_of(Array, ingest_panel_definitions)
  end


  def test_falls_back_to_cache_if_no_service
    assert false, 'Caching not implemented'
  end

end