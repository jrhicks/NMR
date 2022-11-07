import Link from "next/link";
import { useQuery } from "react-query";
import {Layout} from "/components";

const CategoriesPage = () => {
  const getCategories = async () => {
    const res = await fetch("/api/categories");
    return res.json();
  };
  const { data, error, isLoading } = useQuery("categories", getCategories);

  if (isLoading) return <Layout title="Categories" />;

  return (
    <Layout title="Categories">
      <div className="border-b border-gray-200 bg-white px-4 py-5 sm:px-6">
        <div className="-ml-4 -mt-2 flex flex-wrap items-center justify-between sm:flex-nowrap">
          <div className="ml-4 mt-2">
            <h3 className="text-lg font-medium leading-6 text-gray-900">
              Index
            </h3>
          </div>
          <div className="ml-4 mt-2 flex-shrink-0">
            <Link href="/categories/new">
              <button
                type="button"
                className="relative inline-flex items-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
              >
                Add Category
              </button>
            </Link>
          </div>
        </div>
      </div>
      <div className="px-4 py-5 sm:px-6">
        {data.map((category) => {
          return (
            <Link
              key={category.id}
              href={`/categories/show?id=${category.id}`}
              className="block p-1 underline text-indigo-600"
            >
              {category.name}
            </Link>
          );
        })}
      </div>
    </Layout>
  );
};

export default CategoriesPage;
