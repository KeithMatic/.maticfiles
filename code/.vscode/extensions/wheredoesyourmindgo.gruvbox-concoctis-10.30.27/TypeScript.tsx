


    import React from 'react'
    import useSWR from 'swr'
    import TitleCaption from '@components/TitleCaption'

    type Props = {
      uid: number
    }
    type FetchParameters = Parameters<typeof fetch>
    interface UserResponse {
      name: string
    }

    /**
     * Fetcher utility
     *
     * @param args - Fetch arguments
     * @return A function that returns a promise of an object
     */
    const fetcher = (...args: FetchParameters) =>
      fetch(...args).then((res) => res.json())

    export default function Profile({uid}: Props) {
      const shouldFetch = [null, undefined, NaN, '', false, true].every(
        (nada) => uid !== nada
      )
      const {user, error} = useSWR<UserResponse>(
        shouldFetch ? `/api/user/${uid}` : null,
        fetcher
      )

      if (error) return <div>failed to load</div>
      if (!user) return <div>loading...</div>
      return (
        <TitleCaption style={{padding: 24}} className="gruvbox">
          {`Hello ${user.name}!`}
        </TitleCaption>
      )
    }









