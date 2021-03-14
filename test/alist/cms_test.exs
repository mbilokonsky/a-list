defmodule Alist.CMSTest do
  use Alist.DataCase

  alias Alist.CMS

  describe "lists" do
    alias Alist.CMS.List

    @valid_attrs %{body: "some body", title: "some title", views: 42}
    @update_attrs %{body: "some updated body", title: "some updated title", views: 43}
    @invalid_attrs %{body: nil, title: nil, views: nil}

    def list_fixture(attrs \\ %{}) do
      {:ok, list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_list()

      list
    end

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert CMS.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert CMS.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      assert {:ok, %List{} = list} = CMS.create_list(@valid_attrs)
      assert list.body == "some body"
      assert list.title == "some title"
      assert list.views == 42
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()
      assert {:ok, %List{} = list} = CMS.update_list(list, @update_attrs)
      assert list.body == "some updated body"
      assert list.title == "some updated title"
      assert list.views == 43
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_list(list, @invalid_attrs)
      assert list == CMS.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = CMS.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = CMS.change_list(list)
    end
  end

  describe "authors" do
    alias Alist.CMS.Author

    @valid_attrs %{bio: "some bio", genre: "some genre", role: "some role"}
    @update_attrs %{bio: "some updated bio", genre: "some updated genre", role: "some updated role"}
    @invalid_attrs %{bio: nil, genre: nil, role: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert CMS.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert CMS.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = CMS.create_author(@valid_attrs)
      assert author.bio == "some bio"
      assert author.genre == "some genre"
      assert author.role == "some role"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = CMS.update_author(author, @update_attrs)
      assert author.bio == "some updated bio"
      assert author.genre == "some updated genre"
      assert author.role == "some updated role"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_author(author, @invalid_attrs)
      assert author == CMS.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = CMS.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = CMS.change_author(author)
    end
  end
end
