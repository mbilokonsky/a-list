defmodule Alist.ListsTest do
  use Alist.DataCase

  alias Alist.Lists

  describe "list_templates" do
    alias Alist.Lists.ListTemplate

    @valid_attrs %{body: "some body", prompt1: "some prompt1", prompt2: "some prompt2", prompt3: "some prompt3", prompt4: "some prompt4", prompt5: "some prompt5", title: "some title"}
    @update_attrs %{body: "some updated body", prompt1: "some updated prompt1", prompt2: "some updated prompt2", prompt3: "some updated prompt3", prompt4: "some updated prompt4", prompt5: "some updated prompt5", title: "some updated title"}
    @invalid_attrs %{body: nil, prompt1: nil, prompt2: nil, prompt3: nil, prompt4: nil, prompt5: nil, title: nil}

    def list_template_fixture(attrs \\ %{}) do
      {:ok, list_template} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_list_template()

      list_template
    end

    test "list_list_templates/0 returns all list_templates" do
      list_template = list_template_fixture()
      assert Lists.list_list_templates() == [list_template]
    end

    test "get_list_template!/1 returns the list_template with given id" do
      list_template = list_template_fixture()
      assert Lists.get_list_template!(list_template.id) == list_template
    end

    test "create_list_template/1 with valid data creates a list_template" do
      assert {:ok, %ListTemplate{} = list_template} = Lists.create_list_template(@valid_attrs)
      assert list_template.body == "some body"
      assert list_template.prompt1 == "some prompt1"
      assert list_template.prompt2 == "some prompt2"
      assert list_template.prompt3 == "some prompt3"
      assert list_template.prompt4 == "some prompt4"
      assert list_template.prompt5 == "some prompt5"
      assert list_template.title == "some title"
    end

    test "create_list_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_list_template(@invalid_attrs)
    end

    test "update_list_template/2 with valid data updates the list_template" do
      list_template = list_template_fixture()
      assert {:ok, %ListTemplate{} = list_template} = Lists.update_list_template(list_template, @update_attrs)
      assert list_template.body == "some updated body"
      assert list_template.prompt1 == "some updated prompt1"
      assert list_template.prompt2 == "some updated prompt2"
      assert list_template.prompt3 == "some updated prompt3"
      assert list_template.prompt4 == "some updated prompt4"
      assert list_template.prompt5 == "some updated prompt5"
      assert list_template.title == "some updated title"
    end

    test "update_list_template/2 with invalid data returns error changeset" do
      list_template = list_template_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_list_template(list_template, @invalid_attrs)
      assert list_template == Lists.get_list_template!(list_template.id)
    end

    test "delete_list_template/1 deletes the list_template" do
      list_template = list_template_fixture()
      assert {:ok, %ListTemplate{}} = Lists.delete_list_template(list_template)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_list_template!(list_template.id) end
    end

    test "change_list_template/1 returns a list_template changeset" do
      list_template = list_template_fixture()
      assert %Ecto.Changeset{} = Lists.change_list_template(list_template)
    end
  end

  describe "list_items" do
    alias Alist.Lists.ListItem

    @valid_attrs %{label: "some label", link: "some link", short_label: "some short_label", thumbnail_url: "some thumbnail_url"}
    @update_attrs %{label: "some updated label", link: "some updated link", short_label: "some updated short_label", thumbnail_url: "some updated thumbnail_url"}
    @invalid_attrs %{label: nil, link: nil, short_label: nil, thumbnail_url: nil}

    def list_item_fixture(attrs \\ %{}) do
      {:ok, list_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_list_item()

      list_item
    end

    test "list_list_items/0 returns all list_items" do
      list_item = list_item_fixture()
      assert Lists.list_list_items() == [list_item]
    end

    test "get_list_item!/1 returns the list_item with given id" do
      list_item = list_item_fixture()
      assert Lists.get_list_item!(list_item.id) == list_item
    end

    test "create_list_item/1 with valid data creates a list_item" do
      assert {:ok, %ListItem{} = list_item} = Lists.create_list_item(@valid_attrs)
      assert list_item.label == "some label"
      assert list_item.link == "some link"
      assert list_item.short_label == "some short_label"
      assert list_item.thumbnail_url == "some thumbnail_url"
    end

    test "create_list_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_list_item(@invalid_attrs)
    end

    test "update_list_item/2 with valid data updates the list_item" do
      list_item = list_item_fixture()
      assert {:ok, %ListItem{} = list_item} = Lists.update_list_item(list_item, @update_attrs)
      assert list_item.label == "some updated label"
      assert list_item.link == "some updated link"
      assert list_item.short_label == "some updated short_label"
      assert list_item.thumbnail_url == "some updated thumbnail_url"
    end

    test "update_list_item/2 with invalid data returns error changeset" do
      list_item = list_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_list_item(list_item, @invalid_attrs)
      assert list_item == Lists.get_list_item!(list_item.id)
    end

    test "delete_list_item/1 deletes the list_item" do
      list_item = list_item_fixture()
      assert {:ok, %ListItem{}} = Lists.delete_list_item(list_item)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_list_item!(list_item.id) end
    end

    test "change_list_item/1 returns a list_item changeset" do
      list_item = list_item_fixture()
      assert %Ecto.Changeset{} = Lists.change_list_item(list_item)
    end
  end

  describe "lists" do
    alias Alist.Lists.List

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lists.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Lists.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Lists.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = Lists.create_list(@valid_attrs)
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = Lists.update_list(list, @update_attrs)
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_list(list, @invalid_attrs)
      assert list == Lists.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Lists.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Lists.change_list(list)
    end
  end
end
